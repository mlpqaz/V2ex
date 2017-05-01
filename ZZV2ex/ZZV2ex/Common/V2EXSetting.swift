//
//  V2EXSetting.swift
//  ZZV2ex
//
//  Created by ios on 2017/5/1.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

let keyPrefix = "me.fin.V2EXSettings."

class V2EXSetting: NSObject {
   static let sharedInstance = V2EXSetting()
    fileprivate override init() {
       super.init()
    }
    
    subscript(key:String) -> String? {
        get {
          return UserDefaults.standard.object(forKey: keyPrefix + key) as? String
        }
        set {
          UserDefaults.standard.setValue(newValue, forKey: keyPrefix + key)
        }
    }
}
