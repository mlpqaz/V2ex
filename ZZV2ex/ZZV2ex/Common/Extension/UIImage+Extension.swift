//
//  UIImage+Extension.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

extension UIImage {
   
    func roundedCornerImageWithCornerRadius(_ cornerRadius: CGFloat) -> UIImage
    {
       let w  = self.size.width
        let h   = self.size.height
        
        var targetCornerRadius = cornerRadius
        if cornerRadius < 0 {
         targetCornerRadius  = 0
        }
        if cornerRadius > min(w, h) {
          targetCornerRadius = min(w, h)
        }
        let imageFrame = CGRect(x: 0, y: 0, width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        UIBezierPath(roundedRect: imageFrame, cornerRadius: targetCornerRadius).addClip()
        self.draw(in: imageFrame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func  imageUserdTemplateMode(_ named:String) -> UIImage? {
     
        let image = UIImage(named: named)
        if image == nil {
          return nil
        }
        return image!.withRenderingMode(.alwaysTemplate)
    }
}
