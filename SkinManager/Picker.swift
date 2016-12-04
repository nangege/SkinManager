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
  
  public required init(values:[T]) {
    self.valueGenerator = {
      return SkinManager.valueFrom(array: values)
    }
  }
  
  public required init(keyPath:String) {
    self.valueGenerator = {
      return SkinManager.value(forKeyPath: keyPath)
    }
  }
  
  open class func values(_ values:[T]) -> Self{
    return self.init(values: values)
  }
    
  open class func values(_ values:T ...) -> Self{
    return self.init(values: values)
  }
  
  open class func keyPath(_ keyPath:String) -> Self{
    return self.init(keyPath:keyPath)
  }
}

public typealias CGFloatPicker = Picker<CGFloat>
public typealias StringPicker  = Picker<String>
public typealias AttributedStringPicker  = Picker<NSAttributedString>


