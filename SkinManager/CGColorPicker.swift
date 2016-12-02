//
//  CGColorPicker.swift
//  SkinManager
//
//  Created by nantang on 2016/12/2.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

open class CGColorPicker:PickerProtocol,ColorInterface{
  public typealias ValueType = CGColor
  
  public convenience required init(colors:[UIColor]){
    self.init()
    self.valueGenerator = {
      return SkinManager.valueFrom(array: colors)?.cgColor
    }
  }

}
