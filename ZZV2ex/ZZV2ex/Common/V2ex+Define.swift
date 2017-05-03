//
//  V2ex+Define.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width;
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;


func v2Font(_ fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize);
}


func dispatch_sync_safely_main_queue(_ block: ()-> ()) {
    if Thread.isMainThread {
      block()
    }else{
        DispatchQueue.main.sync {
            block()
        }
    }
}
