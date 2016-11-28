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

  @IBOutlet weak var switchButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    view.skin.backgroundColor = .hexs("#2dff86","#77054c")
    switchButton.skin.setTitle(.values("日间","夜间"), for: .normal)
    
    SkinManager.add(observer: self, for: #selector(updateSkin))
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func swichMode(_ sender: Any) {
    SkinManager.skinIndex = (SkinManager.skinIndex + 1)%2
  }

  func updateSkin(){
      print("test hehe")
  }
  
}

