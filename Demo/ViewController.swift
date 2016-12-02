//
//  ViewController.swift
//  Demo
//
//  Created by nantang on 2016/11/24.
//  Copyright © 2016年 nantang. All rights reserved.
//

import UIKit
import SkinManager

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var switchButton: UIButton!
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    view.skin.backgroundColor = .hexs("#2dff86","#77054c")
    label.skin.textColor = .hexs("#fe5533","#33ddff")
    label.skin.alpha = .values([0.8,1.0])
    imageView.skin.image = .names(["day","night"])
    switchButton.skin.setTitle(.values("日间","夜间"), for: .normal)
    
    SkinManager.add(observer: self){
      print("test Block")
    }
    label.backgroundColor = ColorPicker.hexs("#ff00ff","#00ff00").value
    SkinManager.add(observer: self, for: #selector(updateSkin))
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func swichMode(_ sender: Any) {
    switch ThemeManager.theme {
    case .day: ThemeManager.theme = .night
    case .night: ThemeManager.theme = .day
    }
  }

  func updateSkin(){
    print("test hehe")
  }
  
}

