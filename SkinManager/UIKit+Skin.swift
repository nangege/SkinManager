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
    set{ addPicker(newValue, for: .BackgroundColorKey) }
    get{ return pickerFor(.BackgroundColorKey) as? ColorPicker }
  }
    
  public var alpha:CGFloatPicker?{
    set{ addPicker(newValue, for: .AlphaKey)}
    get{ return pickerFor(.AlphaKey) as? CGFloatPicker }
  }
    
  public var tintColor:ColorPicker?{
    set { addPicker(newValue, for: .TintColorKey)}
    get { return pickerFor(.TintColorKey) as? ColorPicker}
  }
}

extension Skin where Base:UILabel{
    
  public var text:StringPicker?{
    set{ addPicker(newValue, for: .TextKey ) }
    get{ return pickerFor(.TextKey) as? StringPicker }
  }
    
  public var textColor:ColorPicker?{
    set{ addPicker(newValue, for: .TextColorKey) }
    get{ return pickerFor(.TextColorKey) as? ColorPicker}
  }
    
  public var tintColor:ColorPicker?{
    set{ addPicker(newValue, for: .TintColorKey) }
    get{ return pickerFor(.TintColorKey) as? ColorPicker }
  }
  
}

extension Skin where Base:UIImageView{
  
  public var image:ImagePicker?{
    set{ addPicker(newValue, for: .ImageKey) }
    get{ return pickerFor(.ImageKey) as? ImagePicker }
  }
  
}

extension Skin where Base:UIButton{
  
  public func setImage(_ imagePicker:ImagePicker, for state:UIControlState){
    addStatePicker(imagePicker, for: state, selector: .SetButtonImageKey)
  }
    
  public func setTitle(_ stringPicker:StringPicker,for state:UIControlState){
    addStatePicker(stringPicker, for: state, selector: .SetButtonTitleKey)
  }
  
  public func setAttributedTitle(_ attributedStrinPicker:AttributedStringPicker, for state:UIControlState){
    addStatePicker(attributedStrinPicker, for: state, selector: .SetButtonAttributeTitleKey)
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
    set{ addPicker(newValue, for: .LayerBackgroundColorKey) }
    get{ return pickerFor(.LayerBackgroundColorKey) as? CGColorPicker }
  }
    
  public var borderColor:CGColorPicker?{
    set{ addPicker(newValue, for: .LayerBorderColorKey) }
    get{ return pickerFor(.LayerBorderColorKey) as? CGColorPicker }
  }
}

private extension Selector{
    
  /// UIView
  static let AlphaKey           = #selector(setter: UIView.alpha)
  static let BackgroundColorKey = #selector(setter: UIView.backgroundColor)
  static let TintColorKey       = #selector(setter: UIView.tintColor)
    
    
  /// UIlabel
  static let TextKey            = #selector(setter: UILabel.text)
  static let TextColorKey       = #selector(setter: UILabel.textColor)
  static let AttributedTextKey  = #selector(setter: UILabel.attributedText)
    
    
  /// UIImageView
  static let ImageKey           = #selector(setter: UIImageView.image)
    
    
  /// UIButton
  static let SetButtonImageKey  = #selector(UIButton.setImage(_:for:))
  static let SetButtonTitleKey  = #selector(UIButton.setTitle(_:for:))
  static let SetButtonBackgroundKey = #selector(UIButton.setBackgroundImage(_:for:))
  static let SetButtonTitleColorKey = #selector(UIButton.setTitleColor(_:for:))
  static let SetButtonAttributeTitleKey  = #selector(UIButton.setAttributedTitle(_:for:))
  
  /// CALayer
  static let LayerBorderColorKey     = #selector(setter: CALayer.borderColor)
  static let LayerBackgroundColorKey = #selector(setter: CALayer.backgroundColor)
    
}
