//: Playground - noun: a place where people can play

import UIKit
import SkinManager

let dict:NSDictionary = ["a":3]

let a = dict.value(forKeyPath: "a")

a as? CGFloat
