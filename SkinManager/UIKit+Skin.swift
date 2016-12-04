//
//  UIKit+Skin.swift
//  SkinManager
//
//  Created by nantang on 2016/11/18.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit

extension Skin where Base:UIView{
  
  public var backgroundColor:ColorPicker? {
    set{ addPicker(newValue, for: .BackgroundColor) }
    get{ return pickerFor(.BackgroundColor) as? ColorPicker }
  }
  
  public var alpha:CGFloatPicker? {
    set{ addPicker(newValue, for: .Alpha)}
    get{ return pickerFor(.Alpha) as? CGFloatPicker }
  }
  
  public var tintColor:ColorPicker? {
    set { addPicker(newValue, for: .TintColor)}
    get { return pickerFor(.TintColor) as? ColorPicker}
  }
}

extension Skin where Base:UILabel {
  
  public var text:StringPicker? {
    set{ addPicker(newValue, for: .Text ) }
    get{ return pickerFor(.Text) as? StringPicker }
  }
  
  public var textColor:ColorPicker? {
    set{ addPicker(newValue, for: .TextColor) }
    get{ return pickerFor(.TextColor) as? ColorPicker}
  }
  
  public var tintColor:ColorPicker? {
    set{ addPicker(newValue, for: .TintColor) }
    get{ return pickerFor(.TintColor) as? ColorPicker }
  }
  
  public var shadowColor:ColorPicker? {
    set{ addPicker(newValue, for: .ShadowColor) }
    get{ return pickerFor(.ShadowColor) as? ColorPicker }
  }
  
  public var highlightedTextColor:ColorPicker? {
    set{ addPicker(newValue, for: .HighlightedTextColor) }
    get{ return pickerFor(.HighlightedTextColor) as? ColorPicker }
  }
  
}

extension Skin where Base:UITextView {
  public var textColor:ColorPicker?{
    set{ addPicker(newValue, for: .TextViewTextColor) }
    get{ return pickerFor(.TextViewTextColor) as? ColorPicker }
  }
}

extension Skin where Base:UITextField {
  public var textColor:ColorPicker? {
    set{ addPicker(newValue, for: .TextFieldTextColor) }
    get{ return pickerFor(.TextFieldTextColor) as? ColorPicker }
  }
}

extension Skin where Base:UIImageView {
  
  public var image:ImagePicker? {
    set{ addPicker(newValue, for: .Image) }
    get{ return pickerFor(.Image) as? ImagePicker }
  }
  
}

extension Skin where Base:UIButton {
  
  public func setImage(_ imagePicker:ImagePicker?, for state:UIControlState) {
    addStatePicker(imagePicker, for: state, selector: .SetButtonImage)
  }
  
  public func setBackgroundColor(_ imagePicker:ImagePicker?, for state:UIControlState) {
    addPicker(imagePicker, for: .SetButtonBackground)
  }
  
  public func setTitle(_ stringPicker:StringPicker?,for state:UIControlState) {
    addStatePicker(stringPicker, for: state, selector: .SetButtonTitle)
  }
  
  public func setTitleColor(_ colorPicker:ColorPicker?, for state:UIControlState) {
    addPicker(colorPicker, for: .SetButtonTitleColor)
  }
  
  public func setAttributedTitle(_ attributedStrinPicker:AttributedStringPicker?, for state:UIControlState) {
    addStatePicker(attributedStrinPicker, for: state, selector: .SetButtonAttributeTitle)
  }
}

extension Skin where Base:UITableView {
  
  public var separatorColor:ColorPicker?{
    set{ addPicker(newValue, for: .SeparatorColor) }
    get{ return pickerFor(.SeparatorColor) as? ColorPicker }
  }
}

extension Skin where Base:UIProgressView {
  public var trackTintColor:ColorPicker?{
    set{ addPicker(newValue, for: .TrackTintColor)}
    get{ return pickerFor(.TrackTintColor) as? ColorPicker}
  }
  
  public var progressTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .ProgressTintColor) }
    get{ return pickerFor(.ProgressTintColor) as? ColorPicker }
  }
  
  public var progressImage:ImagePicker? {
    set{ addPicker(newValue, for: .ProgressImage) }
    get{ return pickerFor(.ProgressImage) as? ImagePicker}
  }
  
  public var trackImage:ImagePicker? {
    set{ addPicker(newValue, for: .TrackImage) }
    get{ return pickerFor(.TrackImage) as? ImagePicker }
  }
}

extension Skin where Base:UIPageControl {
  public var pageIndicatorTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .PageIndicatorTintColor) }
    get{ return pickerFor(.PageIndicatorTintColor) as? ColorPicker }
  }
  
  public var currentPageIndicatorTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .CurrentPageIndicatorTintColor) }
    get{ return pickerFor(.CurrentPageIndicatorTintColor) as? ColorPicker}
  }
}

extension Skin where Base:UIToolbar {
  public var barTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .ToolBarTintColor)}
    get{ return pickerFor(.ToolBarTintColor) as? ColorPicker }
  }
}

extension Skin where Base:UISearchBar {
  public var barTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .SearchBarTintColor)}
    get{ return pickerFor(.SearchBarTintColor) as? ColorPicker }
  }
}

extension Skin where Base:UINavigationBar {
  public var barTintColor:ColorPicker?{
    set{ addPicker(newValue, for: .NavigationBarTintColor)}
    get{ return pickerFor(.NavigationBarTintColor) as? ColorPicker }
  }
}

extension Skin where Base:UITabBar {
  public var barTintColor:ColorPicker?{
    set{ addPicker(newValue, for: .TabBarTintColor)}
    get{ return pickerFor(.TabBarTintColor) as? ColorPicker }
  }
}

extension Skin where Base:UISwitch {
  public var onTintColor:ColorPicker?{
    set{ addPicker(newValue, for: .OnTintColor) }
    get{ return pickerFor(.OnTintColor) as? ColorPicker }
  }
  
  public var thumbTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .ThumbTintColor) }
    get{ return pickerFor(.ThumbTintColor) as? ColorPicker }
  }
  
  public var onImage:ImagePicker? {
    set{ addPicker(newValue, for: .OnImage) }
    get{ return pickerFor(.OnImage) as? ImagePicker }
  }
  
  public var offImage:ImagePicker? {
    set{ addPicker(newValue, for: .OffImage) }
    get{ return pickerFor(.OnImage) as? ImagePicker }
  }
  
}

extension Skin where Base:UISlider {
  var sliderThumbTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .SliderThumbTintColor) }
    get{ return pickerFor(.SliderThumbTintColor) as? ColorPicker}
  }
  
  var maximumTrackTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .MaximumTrackTintColor) }
    get{ return pickerFor(.MaximumTrackTintColor) as? ColorPicker }
  }
  
  var minimumTrackTintColor:ColorPicker? {
    set{ addPicker(newValue, for: .MinimumTrackTintColor) }
    get{ return pickerFor(.MinimumTrackTintColor) as? ColorPicker }
  }
}

extension Skin where Base:CALayer {
  
  public var backgroundColor:CGColorPicker? {
    set{ addPicker(newValue, for: .LayerBackgroundColor) }
    get{ return pickerFor(.LayerBackgroundColor) as? CGColorPicker }
  }
  
  public var borderColor:CGColorPicker? {
    set{ addPicker(newValue, for: .LayerBorderColor) }
    get{ return pickerFor(.LayerBorderColor) as? CGColorPicker }
  }
  
  public var shadowColor:CGColorPicker? {
    set{ addPicker(newValue, for: .LayerShadowColor) }
    get{ return pickerFor(.LayerShadowColor) as? CGColorPicker }
  }
}

extension Skin where Base:CAShapeLayer {
  public var fillColor:CGColorPicker? {
    set{ addPicker(newValue , for: .ShapeLayerFillColor)}
    get{ return pickerFor(.ShapeLayerFillColor) as? CGColorPicker }
  }
  
  public var strokeColor:CGColorPicker? {
    set{ addPicker(newValue, for: .ShaperLayerStrokeColor)}
    get{ return pickerFor(.ShaperLayerStrokeColor) as? CGColorPicker}
  }
}

private extension Selector {
  
  /// UIView
  static let Alpha           = #selector(setter: UIView.alpha)
  static let BackgroundColor = #selector(setter: UIView.backgroundColor)
  static let TintColor       = #selector(setter: UIView.tintColor)
  
  /// UIlabel
  static let Text            = #selector(setter: UILabel.text)
  static let TextColor       = #selector(setter: UILabel.textColor)
  static let AttributedText  = #selector(setter: UILabel.attributedText)
  static let HighlightedTextColor = #selector(setter: UILabel.highlightedTextColor)
  static let ShadowColor = #selector(setter: UILabel.shadowColor)
  
  /// UITextView
  static let TextViewTextColor = #selector(setter: UITextView.textColor)

  /// UITextField
  static let TextFieldTextColor = #selector(setter: UITextField.textColor)

  /// UIImageView
  static let Image           = #selector(setter: UIImageView.image)
  
  /// UIButton
  static let SetButtonImage  = #selector(UIButton.setImage(_:for:))
  static let SetButtonTitle  = #selector(UIButton.setTitle(_:for:))
  static let SetButtonBackground = #selector(UIButton.setBackgroundImage(_:for:))
  static let SetButtonTitleColor = #selector(UIButton.setTitleColor(_:for:))
  static let SetButtonAttributeTitle  = #selector(UIButton.setAttributedTitle(_:for:))
  
  /// UISwitch
  static let OnImage        = #selector(setter: UISwitch.onImage)
  static let OffImage       = #selector(setter: UISwitch.offImage)
  static let OnTintColor    = #selector(setter: UISwitch.onTintColor)
  static let ThumbTintColor = #selector(setter: UISwitch.thumbTintColor)

  /// UIProgressView
  static let TrackImage        = #selector(setter: UIProgressView.trackImage)
  static let TrackTintColor    = #selector(setter: UIProgressView.trackTintColor)
  static let ProgressImage     = #selector(setter: UIProgressView.progressImage)
  static let ProgressTintColor = #selector(setter: UIProgressView.progressTintColor)
  
  /// UIPageControl
  static let PageIndicatorTintColor        = #selector(setter: UIPageControl.pageIndicatorTintColor)
  static let CurrentPageIndicatorTintColor = #selector(setter: UIPageControl.currentPageIndicatorTintColor)
  
  
  /// UISlider
  static let SliderThumbTintColor  = #selector(setter: UISlider.thumbTintColor)
  static let MaximumTrackTintColor = #selector(setter: UISlider.maximumTrackTintColor)
  static let MinimumTrackTintColor = #selector(setter: UISlider.minimumTrackTintColor)
  
  /// UITableView
  static let SeparatorColor = #selector(setter: UITableView.separatorColor)
  
  /// UIToolbar
  static let ToolBarTintColor = #selector(setter: UIToolbar.barTintColor)
  
  /// UINavigationBar
  static let NavigationBarTintColor = #selector(setter: UINavigationBar.barTintColor)
  
  /// UITabBar
  static let TabBarTintColor = #selector(setter: UITabBar.barTintColor)
  
  /// UISearchBar
  static let SearchBarTintColor = #selector(setter: UISearchBar.barTintColor)
  
  /// CALayer
  static let LayerBorderColor     = #selector(setter: CALayer.borderColor)
  static let LayerShadowColor     = #selector(setter: CALayer.shadowColor)
  static let LayerBackgroundColor = #selector(setter: CALayer.backgroundColor)
  
  /// CAShaperLayer
  static let ShapeLayerFillColor    = #selector(setter: CAShapeLayer.fillColor)
  static let ShaperLayerStrokeColor = #selector(setter: CAShapeLayer.strokeColor)
  
}
