# SkinManager
 SkinManager is a lightweight, pure-Swift library for managing app themes. This project is heavily inspired by many open source project, such as [swiftTheme](https://github.com/jiecao-fm/SwiftTheme), [NightNight](https://github.com/Draveness/NightNight). Compared to other,SkinManager offers swifty API,simple to use notification,and many other features.
 

### Features
- [x] Swifty design implement and API
- [x] Simple to extend
- [x] Optimized for UIImage and UIColor 
- [x] Easy to use notification

### Requirements

* iOS 7.0+
* swift 3

## Installation

* For iOS 8+ , use Carthage:   github "https://github.com/nangege/SkinManager"
* For iOS 7+ , copy the source files into you project

## Usage

### Theme

1. config Theme Data

        view.skin.backgroundColor = ColorPicker.hexs("#2dff86","#77054c")
    
        label.skin.textColor = ColorPicker.hexs("#fe5533","#33ddff")
    
        label.skin.alpha = CGFloatPicker.values([0.8,1.0])
        
        imageView.skin.image = ImagePicker.names(["day","night"])
 
   or, you can remove all the types
 
        view.skin.backgroundColor = .hexs("#2dff86","#77054c")
    
        label.skin.textColor = .hexs("#fe5533","#33ddff")
    
        label.skin.alpha = .values([0.8,1.0])
        
        imageView.skin.image = .names(["day","night"])
 
2. Change theme
   
   * define your own theme name
   
            public enum Theme:Int{
              case day = 0      
              case night
            }

            struct ThemeManager{
              public static var theme:Theme = .day{
                didSet{ SkinManager.skinIndex = theme.rawValue }
               }
            }
   * switch Theme
   
            switch ThemeManager.theme {
              case .day: ThemeManager.theme = .night
              case .night: ThemeManager.theme = .day
            }
 
 
* if don't need to update theme automatically, you can use picker to avoid 'if else'

		view.backgroundColor = ColorPicker.hexs("#ff00ff","#00ff00").value



### Notification

Sometime,you may want to be noticed when theme has changed.SkinManager offers a simple API. You dont need to write many code like:
	 
	  NotificationCenter.default.addObserver(self,  selector: #selector(doMethod), name: NSNotification.Name(rawValue: "NotificationName"), object: nil)

and remove when dealloc 
    
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue:NotificationName), object: nil)

Simply write:

    SkinManager.add(observer: self, for: #selector(doMethod))

or use closure

    SkinManager.add(observer: self){ doSomeThing }

Obsever will be removed automatically after dealloc was called.




## Supported Properties
#### UIView
	
    var backgroundColor:ColorPicker?
	  
	var alpha:CGFloatPicker?
	  
    var tintColor:ColorPicker?

#### UILabel
  
    var text:StringPicker?
	 
	var textColor:ColorPicker?
	  
	var tintColor:ColorPicker?
	  
	var shadowColor:ColorPicker?
	  
	var highlightedTextColor:ColorPicker?
 

#### UITextView{
 
    var textColor:ColorPicker?

#### UITextField

    var textColor:ColorPicker?

#### UIImageView

    var image:ImagePicker?

#### UIButton
  
    func setImage(_ imagePicker:ImagePicker?, for state:UIControlState)
  
    func setBackgroundColor(_ imagePicker:ImagePicker?, for state:UIControlState)
    
    func setTitle(_ stringPicker:StringPicker?,for state:UIControlState)
  
    func setTitleColor(_ colorPicker:ColorPicker?, for state:UIControlState)
  
    func setAttributedTitle(_ attributedStringPicker:AttributedStringPicker?, for state:UIControlState)

#### UITableView
  
    var separatorColor:ColorPicker?

#### UIProgressView
    
    var trackTintColor:ColorPicker?
  
    var progressTintColor:ColorPicker?
  
    var progressImage:ImagePicker?
  
    var trackImage:ImagePicker?

#### UIPageControl
 
    var pageIndicatorTintColor:ColorPicker?
  
    var currentPageIndicatorTintColor:ColorPicker?

#### UIToolbar
 
    var barTintColor:ColorPicker?

#### UISearchBar
    
    var barTintColor:ColorPicker?

#### UINavigatonBar
    
    public var barTintColor:ColorPicker?

#### UITabBar

    var barTintColor:ColorPicker?

#### UISwitch
    
    var onTintColor:ColorPicker?
  
    var thumbTintColor:ColorPicker?
  
    var onImage:ImagePicker?
  
    var offImage:ImagePicker?

#### UISlider

    var sliderThumbTintColor:ColorPicker?
  
    var maximumTrackTintColor:ColorPicker?
  
    var minimumTrackTintColor:ColorPicker?

#### CALayer
  
    var backgroundColor:CGColorPicker?
 
    var borderColor:CGColorPicker?
  
    var shadowColor:CGColorPicker?

#### CAShapeLayer
    var fillColor:CGColorPicker? 
 
    var strokeColor:CGColorPicker?


## Lisence

The MIT License (MIT)

Copyright (c) 2016 nangezao  (https://github.com/nangege/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

