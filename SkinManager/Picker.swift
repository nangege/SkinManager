//
//  Info.swift
//  SkinManager
//
//  Created by nantang on 2016/11/17.
//  Copyright © 2016年 nantang. All rights reserved.
//

import Foundation

open class Picker<T>:PickerProtocol {
    
  public typealias ValueType = T
  
  
  public convenience init(values:[T]){
    self.init()
    self.valueGenerator = {
      return SkinManager.valueFrom(array: values)
    }
  }
    
  open class func values(_ values:[T]) -> Picker<T>{
    return Picker<T>(values: values)
  }
    
  open class func values(_ values:T ...) -> Picker<T>{
    return Picker<T>(values: values)
  }
}

public typealias CGFloatPicker = Picker<CGFloat>
public typealias StringPicker  = Picker<String>
public typealias AttributedStringPicker  = Picker<NSAttributedString>


