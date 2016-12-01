//
//  ColorPicker.swift
//  Pods
//
//  Created by nantang on 2016/11/8.
//
//

import UIKit

open class ColorPicker:PickerProtocol {
  
  public typealias ValueType = UIColor
  
  public convenience init(colors:[UIColor]){
    self.init()
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)
    }
  }
    
  open class func colors(_ colors:[UIColor]) -> ColorPicker{
      return ColorPicker(colors:colors)
  }
  
  open class func colors(_ colors:UIColor ...) -> ColorPicker{
      return .colors(colors)
  }
    
  open class func hexs(_ hexs:[String]) -> ColorPicker{
      return ColorPicker(colors:hexs.map{
          return UIColor($0)
      })
  }
  
  open class func hexs(_ hexs:String ...) -> ColorPicker{
      return .hexs(hexs)
  }
  
}
