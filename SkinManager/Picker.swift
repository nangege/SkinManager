//
//  Info.swift
//  SkinManager
//
//  Created by nantang on 2016/11/17.
//  Copyright © 2016年 nantang. All rights reserved.
//

import Foundation

open class Picker<T,V:PickerManagerProtocol>:PickerProtocol {
    
  typealias ValueType = T
    
  public convenience init(values:[T]){
    self.init()
    self.valueGenerator = {
      return V.valueFrom(array: values)
    }
  }
    
  open class func values(_ values:[T]) -> Picker<T,V>{
    return Picker<T,V>(values: values)
  }
    
  open class func values(_ values:T ...) -> Picker<T,V>{
    return Picker<T,V>(values: values)
  }
}


