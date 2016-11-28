//
//  StatePicker.swift
//  SkinManager
//
//  Created by nantang on 2016/11/18.
//  Copyright © 2016年 nantang. All rights reserved.
//

import Foundation
import UIKit

internal typealias StateValueType = (state:UIControlState,picker:ValueProtocol?)

internal class StatePicker:PickerProtocol{
    
  typealias ValueType = StateValueType
    
  internal var values:[ValueType]?
    
  internal func addPicker(_ picker:ValueProtocol?, for state:UIControlState){
    if let values = values{
      self.values = values.filter{  $0.state != state }
    }else{
      values = [ValueType]()
    }
    values?.append((state,picker))
  }
}

extension StatePicker:Applicable{
    
  func apply(to obj: AnyObject, sel: Selector) {
        
    guard let obj =  obj as? NSObject , obj.responds(to: sel) else { return }
        
    let method = obj.method(for: sel)
    let setState = unsafeBitCast(method, to: setValueForStateIMP.self)
        
    values?.forEach{
      setState(obj,sel,$0.picker?.skinValue as AnyObject,$0.state)
    }
  }
}

private typealias setValueForStateIMP = @convention(c) (NSObject, Selector, AnyObject?, UIControlState) -> Void

extension UIControlState:Hashable{
  public var hashValue: Int{
    return Int(self.rawValue)
  }
}
