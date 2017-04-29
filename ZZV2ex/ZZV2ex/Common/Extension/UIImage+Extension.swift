//
//  UIImage+Extension.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

extension UIImage {
   
    class func  imageUserdTemplateMode(_ named:String) -> UIImage? {
     
        let image = UIImage(named: named)
        if image == nil {
          return nil
        }
        return image!.withRenderingMode(.alwaysTemplate)
    }
}
