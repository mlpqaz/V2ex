//
//  V2EXColor.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

func createImageWithColor(_ color:UIColor) -> UIImage{
    
    return createImageWithColor(color, size: CGSize(width: 1, height: 1))
}
func createImageWithColor(_ color:UIColor, size: CGSize) -> UIImage{

    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(rect.size);
    let context = UIGraphicsGetCurrentContext();
    context?.setFillColor(color.cgColor);
    context?.fill(rect);
    
    let theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage!;
    
}
