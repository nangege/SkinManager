//
//  Skin.swift
//  Pods
//
//  Created by nantang on 2016/11/8.
//
//

import Foundation

public protocol ValueProtocol{
  var skinValue:Any? { get }
}

public protocol Applicable{
  func apply(to:AnyObject,sel:Selector)
}

protocol PickerProtocol:class,ValueProtocol,Applicable{
    
  associatedtype  ValueType
    
  var value:ValueType? { get }
}

private struct Closue<T>{
    
  typealias ClosueType = () -> T?
    
  var closue:ClosueType?
    
  init(closue: ClosueType?) {
    self.closue = closue
  }
}

var AssociatedValueGeneratorKey:UInt8 = 0

extension PickerProtocol{
    
  typealias ValueGenerator = () -> ValueType?
    
  var valueGenerator:ValueGenerator?{
        
    get{ return (objc_getAssociatedObject(self, &AssociatedValueGeneratorKey) as? Closue<ValueType>)?.closue }
    
    set{ objc_setAssociatedObject(self, &AssociatedValueGeneratorKey, Closue<ValueType>( closue: newValue ), .OBJC_ASSOCIATION_COPY_NONATOMIC) }
  }

  var value:ValueType?{
      return valueGenerator?()
  }
}

extension PickerProtocol{
  public var skinValue:Any?{
    return self.value as Any?
  }
}

extension PickerProtocol{
  public func apply(to obj: AnyObject, sel: Selector) {
    guard obj.responds(to: sel) == true else { return }
    _ = obj.perform(sel, with: skinValue)
  }
}


