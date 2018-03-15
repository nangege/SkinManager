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
  
    SkinManager.switchTo(plistName: "DaySkin", path: .mainBundle)
    
    view.skin.backgroundColor = .keyPath("ViewController.backgroundColor")
    
    label.skin.textColor = .hexs("#fe5533","#33ddff")
    label.skin.alpha = .keyPath("ViewController.alpha")
    
    label.backgroundColor = ColorPicker.hexs("#ff00ff","#00ff00").value
    
    imageView.skin.image = .keyPath("ViewController.backgroundImage")
    
    switchButton.skin.setTitle(.values("日间","夜间"), for: .normal)

    SkinManager.add(observer: self, for: #selector(updateSkin))
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

  @objc func updateSkin(){
    print("test hehe")
  }
  
}

