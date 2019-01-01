//
//  ColorGenarator.swift
//  SkinManager
//
//  Created by nantang on 2016/12/2.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

public protocol ColorInterface: PickerProtocol {
  init(colors:[UIColor])
  init(keyPath:String)
}

public extension ColorInterface {
  
  static func colors(_ colors: [UIColor]) -> Self {
    return Self(colors:colors)
  }
  
  static func colors(_ colors: UIColor ...) -> Self {
    return Self.colors(colors)
  }
  
  static func hexs(_ hexs: [String]) -> Self {
    return Self(colors:hexs.map {
      return UIColor($0)
    })
  }
  
  static func hexs(_ hexs: String ...) -> Self {
    return Self.hexs(hexs)
  }
  
  static func keyPath(_ keyPath: String) -> Self {
    return Self(keyPath: keyPath)
  }
}

open class ColorPicker: PickerProtocol,ColorInterface {
  
  public typealias ValueType = UIColor
  
  public required init(colors:[UIColor]) {
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)
    }
  }
  
  public required init(keyPath: String) {
    self.valueGenerator = {
      guard let rgba:String = SkinManager.value(forKeyPath: keyPath) else{ return nil }
      return UIColor(rgba)
    }
  }
}

open class CGColorPicker: PickerProtocol,ColorInterface {
  public typealias ValueType = CGColor
  
  public required init(colors:[UIColor]) {
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)?.cgColor
    }
  }
  
  public required init(keyPath:String) {
    self.valueGenerator = {
      guard let rgba:String = SkinManager.value(forKeyPath: keyPath) else{ return nil }
      return UIColor(rgba).cgColor
    }
  }
  
}
