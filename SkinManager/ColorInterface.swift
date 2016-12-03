//
//  ColorGenarator.swift
//  SkinManager
//
//  Created by nantang on 2016/12/2.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

public protocol ColorInterface:PickerProtocol {
  init(colors:[UIColor])
}

public extension ColorInterface{
  
  static func colors(_ colors:[UIColor]) -> Self{
    return Self(colors:colors)
  }
  
  static func colors(_ colors:UIColor ...) -> Self{
    return Self.colors(colors)
  }
  
  static func hexs(_ hexs:[String]) -> Self{
    return Self(colors:hexs.map{
      return UIColor($0)
    })
  }
  
  static func hexs(_ hexs:String ...) -> Self{
    return Self.hexs(hexs)
  }
}

open class ColorPicker:PickerProtocol,ColorInterface {
  
  public typealias ValueType = UIColor
  
  public convenience required init(colors:[UIColor]){
    self.init()
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)
    }
  }
}

open class CGColorPicker:PickerProtocol,ColorInterface{
  public typealias ValueType = CGColor
  
  public convenience required init(colors:[UIColor]){
    self.init()
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)?.cgColor
    }
  }
  
}
