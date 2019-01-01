//
//  ImagePicker.swift
//  Pods
//
//  Created by nantang on 2016/11/8.
//
//

import UIKit

public typealias Transformer<T> =  (T) -> [T]

open class ImagePicker: PickerProtocol {
    
  public typealias ValueType = UIImage
  
  required public init(names: [String]){
    self.valueGenerator = {
      guard let name = SkinManager.valueFrom(array: names) else { return nil}
      return UIImage(named: name)
    }
  }
  
  required public init(colors: [UIColor]){
    self.valueGenerator = {
      guard let color = SkinManager.valueFrom(array: colors) else { return nil }
      return UIImage.from(color: color)
    }
  }
  
  required public init(hexs: [String]){
    self.valueGenerator = {
      let colors = hexs.map{ return UIColor($0)}
      guard let color = SkinManager.valueFrom(array: colors) else { return nil }
      return UIImage.from(color: color)
    }
  }
  
  required public init(keyPath: String){
    self.valueGenerator = {
      return SkinManager.image(forKeyPath: keyPath)
    }
  }
  
  open class func name(_ name: String,transformer:Transformer<String>) -> ImagePicker{
    return .names(transformer(name))
  }
    
  open class func names(_ names: [String]) -> ImagePicker{
    return ImagePicker(names: names)
  }
  
  open class func names(_ names: String ...) -> ImagePicker{
    return ImagePicker(names: names)
  }
  
  open class func colors(_ colors: [UIColor]) -> ImagePicker{
    return ImagePicker(colors: colors)
  }
  
  open class func colors(_ colors: UIColor ...) -> ImagePicker{
    return ImagePicker(colors: colors)
  }
  
  open class func keyPath(_ keyPath: String) -> ImagePicker{
    return ImagePicker(keyPath: keyPath)
  }
}
