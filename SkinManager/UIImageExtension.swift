//
//  UIImageExtension.swift
//  SkinManager
//
//  Created by nantang on 2016/11/23.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

extension UIImage{
  class func from(color: UIColor,size:CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
}


