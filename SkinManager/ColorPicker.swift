//
//  ColorPicker.swift
//  Pods
//
//  Created by nantang on 2016/11/8.
//
//

import UIKit

open class ColorPicker:PickerProtocol,ColorInterface {
  
  public typealias ValueType = UIColor
  
  public convenience required init(colors:[UIColor]){
    self.init()
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)
    }
  }
  
}
