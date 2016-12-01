//
//  Theme.swift
//  SkinManager
//
//  Created by nantang on 2016/11/30.
//  Copyright © 2016年 nantang. All rights reserved.
//

import Foundation
import SkinManager

public enum Theme:Int {
  case day = 0
  case night
}

struct ThemeManager{
  public static var theme:Theme = .day{
    didSet{ SkinManager.skinIndex = theme.rawValue }
  }
}
