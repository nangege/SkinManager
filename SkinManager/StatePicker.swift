//
//  StatePicker.swift
//  SkinManager
//
//  Created by nantang on 2016/11/18.
//  Copyright © 2016年 nantang. All rights reserved.
//

import Foundation
import UIKit

typealias StateValueType = (state: UIControl.State, picker: ValueProtocol?)

class StatePicker: PickerProtocol{
    
  typealias ValueType = StateValueType
    
  var values: [ValueType]?
    
  func addPicker(_ picker: ValueProtocol?, for state: UIControl.State) {
    if let values = values {
      self.values = values.filter{  $0.state != state }
    }else{
      values = [ValueType]()
    }
    values?.append((state,picker))
  }
}

extension StatePicker: Applicable {
    
  func apply(to obj: AnyObject, sel: Selector) {
    
    guard let obj =  obj as? NSObject , obj.responds(to: sel) else { return }
        
    let method = obj.method(for: sel)
    let setState = unsafeBitCast(method, to: setValueForStateIMP.self)
        
    values?.forEach{
      setState(obj,sel, $0.picker?.skinValue as AnyObject, $0.state)
    }
  }
  
  private typealias setValueForStateIMP = @convention(c) (NSObject, Selector, AnyObject?, UIControl.State) -> Void
}

extension UIControl.State: Hashable{}
