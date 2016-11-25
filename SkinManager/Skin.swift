//
//  Skin.swift
//  SkinManager
//
//  Created by nantang on 2016/11/18.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

private var SkinPickersKey:UInt8 = 0

public final class Skin<Base:NSObjectProtocol> {
  public let base:Base
  
  public init(_ base:Base){
      self.base = base
  }
}

extension Skin{
    
  typealias ContainerType = [Selector:Applicable]
    
  private var skinPickers:ContainerType{
    get{
      if let pickers = objc_getAssociatedObject(base, &SkinPickersKey)  {  return pickers as! ContainerType }
            
      let pickers = ContainerType()
      SkinManager.add(observer: base as! NSObject)
      objc_setAssociatedObject(base, &SkinPickersKey, pickers, .OBJC_ASSOCIATION_COPY_NONATOMIC)
      return pickers
    }
        
    set{ objc_setAssociatedObject(base, &SkinPickersKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
  }
    
  public func addPicker(_ picker:Applicable?,for key:Selector){
    
    guard let picker = picker else{
      skinPickers.removeValue(forKey: key)
      return
    }
    
    skinPickers[key] = picker
    perform(key, picker: picker)
  }
    
  public func pickerFor(_ key:Selector) -> Applicable?{
    return skinPickers[key]
  }
    
  private func perform(_ sel:Selector,picker:Applicable){
    picker.apply(to: base, sel: sel)
  }
    
  internal func updateSkin(){
    skinPickers.forEach { (key: Selector, value: Applicable) in
      perform(key, picker: value)
    }
  }
}

extension NSObjectProtocol{
  public var skin:Skin<Self>{
    return Skin(self)
  }
    
  internal func updateSkin(){
    skin.updateSkin()
  }
}
