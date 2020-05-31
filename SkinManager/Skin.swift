//
//  Skin.swift
//  SkinManager
//
//  Created by nantang on 2016/11/18.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

private var SkinPickersKey: UInt8 = 0

public final class Skin<Base> {
  public let base: Base
  
  public init(_ base: Base){
      self.base = base
  }
}

extension Skin where Base: NSObject{
    
  typealias ContainerType = [Selector: Applicable]
    
  private var skinPickers: ContainerType{
    get{
      if let pickers = objc_getAssociatedObject(base, &SkinPickersKey)  {  return pickers as! ContainerType }
            
      let pickers = ContainerType()
      SkinManager.add(observer: base)
      objc_setAssociatedObject(base, &SkinPickersKey, pickers, .OBJC_ASSOCIATION_COPY_NONATOMIC)
      return pickers
    }
        
    set{ objc_setAssociatedObject(base, &SkinPickersKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC) }
  }
    
  public func addPicker(_ picker: Applicable?, for key: Selector){
    
    guard let picker = picker else{
      skinPickers.removeValue(forKey: key)
      return
    }
    
    skinPickers[key] = picker
    perform(key, picker: picker)
  }
    
  public func pickerFor(_ key: Selector) -> Applicable?{
    return skinPickers[key]
  }
  
  public func addStatePicker(_ picker: ValueProtocol?, for state: UIControl.State, selector: Selector){
    
    if let statePicker = pickerFor(selector) as? StatePicker{
      statePicker.addPicker(picker, for: state)
    }else{
      let statePicker = StatePicker()
      statePicker.addPicker(picker, for: state)
      addPicker(statePicker, for: selector)
    }
  }
  
  private func perform(_ sel: Selector,picker: Applicable){
    picker.apply(to: base, sel: sel)
  }
    
  func updateSkin(){
    skinPickers.forEach{perform($0.key, picker: $0.value)}
  }
}

extension NSObjectProtocol{
  public var skin: Skin<Self>{
    return Skin(self)
  }
}
