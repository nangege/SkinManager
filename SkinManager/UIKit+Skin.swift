//
//  UIKit+Skin.swift
//  SkinManager
//
//  Created by nantang on 2016/11/18.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

public typealias CGFloatPicker = Picker<CGFloat,SkinManager>
public typealias CGColorPicker = Picker<CGColor,SkinManager>
public typealias StringPicker  = Picker<String,SkinManager>
public typealias AttributedStringPicker  = Picker<NSAttributedString,SkinManager>

extension Skin where Base:UIView{
  
  public var backgroundColor:ColorPicker?{
    set{ addPicker(newValue, for: .BackgroundColor) }
    get{ return pickerFor(.BackgroundColor) as? ColorPicker }
  }
  
  public var alpha:CGFloatPicker?{
    set{ addPicker(newValue, for: .Alpha)}
    get{ return pickerFor(.Alpha) as? CGFloatPicker }
  }
  
  public var tintColor:ColorPicker?{
    set { addPicker(newValue, for: .TintColor)}
    get { return pickerFor(.TintColor) as? ColorPicker}
  }
}

extension Skin where Base:UILabel{
  
  public var text:StringPicker?{
    set{ addPicker(newValue, for: .Text ) }
    get{ return pickerFor(.Text) as? StringPicker }
  }
  
  public var textColor:ColorPicker?{
    set{ addPicker(newValue, for: .TextColor) }
    get{ return pickerFor(.TextColor) as? ColorPicker}
  }
  
  public var tintColor:ColorPicker?{
    set{ addPicker(newValue, for: .TintColor) }
    get{ return pickerFor(.TintColor) as? ColorPicker }
  }
  
}

extension Skin where Base:UIImageView{
  
  public var image:ImagePicker?{
    set{ addPicker(newValue, for: .Image) }
    get{ return pickerFor(.Image) as? ImagePicker }
  }
  
}

extension Skin where Base:UIButton{
  
  public func setImage(_ imagePicker:ImagePicker, for state:UIControlState){
    addStatePicker(imagePicker, for: state, selector: .SetButtonImage)
  }
  
  public func setBackgroundColor(_ imagePicker:ImagePicker, for state:UIControlState){
    addPicker(imagePicker, for: .SetButtonBackground)
  }
  
  public func setTitle(_ stringPicker:StringPicker,for state:UIControlState){
    addStatePicker(stringPicker, for: state, selector: .SetButtonTitle)
  }
  
  public func setTitleColor(_ colorPicker:ColorPicker, for state:UIControlState){
    addPicker(colorPicker, for: .SetButtonTitleColor)
  }
  
  public func setAttributedTitle(_ attributedStrinPicker:AttributedStringPicker, for state:UIControlState){
    addStatePicker(attributedStrinPicker, for: state, selector: .SetButtonAttributeTitle)
  }
  
  private func addStatePicker(_ picker:ValueProtocol,for state:UIControlState,selector:Selector){
    
    if let statePicker = pickerFor(selector) as? StatePicker{
      statePicker.addPicker(picker, for: state)
    }else{
      let statePicker = StatePicker()
      statePicker.addPicker(picker, for: state)
      addPicker(statePicker, for: selector)
    }
  }
  
}

extension Skin where Base:CALayer{
  
  public var backgroundColor:CGColorPicker?{
    set{ addPicker(newValue, for: .LayerBackgroundColor) }
    get{ return pickerFor(.LayerBackgroundColor) as? CGColorPicker }
  }
  
  public var borderColor:CGColorPicker?{
    set{ addPicker(newValue, for: .LayerBorderColor) }
    get{ return pickerFor(.LayerBorderColor) as? CGColorPicker }
  }
}

extension Skin where Base:UISwitch{
  public var onTintColor:ColorPicker?{
    set{ addPicker(newValue, for: .OnTintColor) }
    get{ return pickerFor(.OnTintColor) as? ColorPicker }
  }
  
  public var thumbTintColor:ColorPicker?{
    set{ addPicker(newValue, for: .ThumbTintColor) }
    get{ return pickerFor(.ThumbTintColor) as? ColorPicker }
  }
  
  public var onImage:ImagePicker?{
    set{ addPicker(newValue, for: .OnImage) }
    get{ return pickerFor(.OnImage) as? ImagePicker }
  }
  
  public var offImage:ImagePicker?{
    set{ addPicker(newValue, for: .OffImage) }
    get{ return pickerFor(.OnImage) as? ImagePicker }
  }
  
}

private extension Selector{
  
  /// UIView
  static let Alpha           = #selector(setter: UIView.alpha)
  static let BackgroundColor = #selector(setter: UIView.backgroundColor)
  static let TintColor       = #selector(setter: UIView.tintColor)
  
  /// UIlabel
  static let Text            = #selector(setter: UILabel.text)
  static let TextColor       = #selector(setter: UILabel.textColor)
  static let AttributedText  = #selector(setter: UILabel.attributedText)
  
  /// UIImageView
  static let Image           = #selector(setter: UIImageView.image)
  
  /// UIButton
  static let SetButtonImage  = #selector(UIButton.setImage(_:for:))
  static let SetButtonTitle  = #selector(UIButton.setTitle(_:for:))
  static let SetButtonBackground = #selector(UIButton.setBackgroundImage(_:for:))
  static let SetButtonTitleColor = #selector(UIButton.setTitleColor(_:for:))
  static let SetButtonAttributeTitle  = #selector(UIButton.setAttributedTitle(_:for:))
  
  /// UISwitch
  static let OnTintColor = #selector(setter: UISwitch.onTintColor)
  static let ThumbTintColor = #selector(setter: UISwitch.thumbTintColor)
  static let OnImage = #selector(setter: UISwitch.onImage)
  static let OffImage = #selector(setter: UISwitch.offImage)
  
  /// CALayer
  static let LayerBorderColor     = #selector(setter: CALayer.borderColor)
  static let LayerBackgroundColor = #selector(setter: CALayer.backgroundColor)
  
}
