//
//  ImagePicker.swift
//  Pods
//
//  Created by nantang on 2016/11/8.
//
//

import UIKit

public typealias Transformer<T> =  (T) -> [T]

open class ImagePicker:PickerProtocol {
    
  public typealias ValueType = UIImage
    
  convenience init(names:[String]){
    self.init()
    self.valueGenerator = {
      guard let name = SkinManager.valueFrom(array: names) else { return nil}
      return UIImage(named: name)
    }
  }
  
  convenience init(colors:[UIColor]){
    self.init()
    self.valueGenerator = {
      guard let color = SkinManager.valueFrom(array: colors) else { return nil }
      return UIImage.from(color: color)
    }
  }
  
  convenience init(hexs:[String]){
    self.init()
    self.valueGenerator = {
      let colors = hexs.map{ return UIColor($0)}
      guard let color = SkinManager.valueFrom(array: colors) else { return nil }
      return UIImage.from(color: color)
    }
  }
  
  convenience init(keyPath: String){
    self.init()
    self.valueGenerator = {
      guard let imagePath:String = SkinManager.value(forKeyPath: keyPath) else { return nil}
      return UIImage(named: imagePath)
    }
  }
  
  open class func images(_ images:[UIImage]) -> ImagePicker{
    return ImagePicker()
  }
  
  open class func name(_ name:String,transformer:Transformer<String>) -> ImagePicker{
    return .names(transformer(name))
  }
    
  open class func names(_ names:[String]) -> ImagePicker{
    return ImagePicker(names: names)
  }
  
  open class func names(_ names:String ...) -> ImagePicker{
    return ImagePicker(names: names)
  }
  
  open class func colors(_ colors:[UIColor]) -> ImagePicker{
    return ImagePicker(colors: colors)
  }
  
  open class func colors(_ colors:UIColor ...) -> ImagePicker{
    return ImagePicker(colors: colors)
  }
  
  open class func keyPath(_ keyPath:String) -> ImagePicker{
    return ImagePicker(keyPath: keyPath)
  }
}
