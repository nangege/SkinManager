//
//  File.swift
//  SkinManager
//
//  Created by nantang on 2016/11/16.
//  Copyright © 2016年 nantang. All rights reserved.
//

import Foundation

public protocol ValueFilter {
  static func valueFrom<T>(array:[T]?) -> T?
}

public protocol keyPathValue {
  static func value<T>(forKeyPath keyPath: String) -> T?
}

public struct SkinManager {
  public static var skinIndex: Int = 0 {
    didSet{
      updateSkin()
      performActions()
    }
  }
  
  fileprivate static var skinDict: NSDictionary?
  fileprivate static var path: Path?
  
  public static func switchTo(plistName: String, path: Path){
    guard let plistPath = path.plistPath(name: plistName) else {
      assertionFailure("SkinManager:  No plist named \(plistName) from \(path)")
      return
    }
    guard let plistDict = NSDictionary(contentsOfFile: plistPath) else {
      assertionFailure("SkinManager: Read plist failed from \(plistPath)")
      return
    }
    switchTo(skinDict: plistDict, path: path)
  }
  
  public static func switchTo(skinDict: NSDictionary, path: Path){
    self.skinDict = skinDict
    self.path = path
    updateSkin()
    performActions()
  }

  fileprivate static var objectActionMapper = Dictionary<Weak<NSObject>, AnyObject>()
  fileprivate static var objectToUpdate = Set<Weak<NSObject>>()
  
  private static func updateSkin() {
    objectToUpdate.forEach{ $0.value?.skin.updateSkin() }
  }
    
  private static func performActions() {
    objectActionMapper.forEach { (key: Weak<NSObject>, value: AnyObject) in
      if let value = value as? Block {
        value.block()
        return
      }
      
      if let value = value as? String,let obj = key.value {
        let sel = NSSelectorFromString(value)
        if obj.responds(to: sel) {
          _ = obj.perform(sel)
        }
      }
    }
  }
}

extension SkinManager{
  internal static func add(observer: NSObject) {
    self.objectToUpdate.insert(Weak(value: observer))
  }
  
  public static func add(observer: NSObject, for sel: Selector) {
    self.objectActionMapper[Weak(value: observer)] = NSStringFromSelector(sel) as AnyObject?
  }
  
  public static func add(observer: NSObject, using block:@escaping () -> ()) {
    self.objectActionMapper[Weak(value: observer)] =  Block(block: block)
  }
  
  public static func remove(observer: NSObject) {
    self.objectActionMapper.removeValue(forKey: Weak(value:observer))
  }
}

extension SkinManager: ValueFilter {
  public static func valueFrom<T>(array: [T]?) -> T? {
    guard let array = array, array.count > 0 else{ return nil }
    
    if array.count <= skinIndex {
      return array.first
    }
  
    return array[skinIndex]
  }
}

extension SkinManager: keyPathValue {
  public static func value<T>(forKeyPath keyPath: String) -> T? {
    return skinDict?.value(forKeyPath: keyPath) as? T
  }
  
  public static func image(forKeyPath keyPath: String) -> UIImage?{
    
    guard let imageName: String = value(forKeyPath: keyPath) else { return nil }
    
    if let filePath = path?.URL?.appendingPathComponent(imageName).path {
      return UIImage(contentsOfFile: filePath)
    } else {
      return UIImage(named: imageName)
    }
  }
}

public enum Path {
  
  case mainBundle
  case sandbox(Foundation.URL)
  
  public var URL: Foundation.URL? {
    switch self {
    case .mainBundle: return nil
    case .sandbox(let path): return path
    }
  }
  
  public func plistPath(name: String) -> String? {
    switch self {
    case .mainBundle:        return Bundle.main.path(forResource: name, ofType: "plist")
    case .sandbox(let path): return Foundation.URL(string: name + ".plist", relativeTo: path)?.path
    }
  }
}

class Weak<T: NSObject>: Hashable, CustomStringConvertible {
  weak var value : T?
  let hashCache: Int
  init (value: T) {
    self.value = value
    hashCache = value.hashValue
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(hashCache)
  }

  public static func == (lhs:Weak<T>,rhs:Weak<T>) -> Bool{
      return lhs === rhs
  }
  
  var description: String{
    return "Weak<\(String(describing: value?.description))>"
  }
}


typealias Action = () -> ()

private class Block: NSObject {
  var block: Action
  init(block:@escaping Action) {
    self.block = block
  }
}
