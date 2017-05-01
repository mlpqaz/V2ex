//
//  V2EXColor.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

func colorWith255RGB (_ r: CGFloat , g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 255)
}

func colorWith255RGBA(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green : g/255.0, blue: b/255.0, alpha: a/255)
}


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

//使用协议 方便以后切换颜色配置文件、或者做主题配色之类乱七八糟产品经理最爱的功能

protocol V2EXColorProtocol {
    var v2_backgroundColor: UIColor{ get }
    var v2_navigationBarTintColor: UIColor{ get }
    var v2_TopicListTitleColor : UIColor { get }
    var v2_TopicListUserNameColor : UIColor { get }
    var v2_TopicListDateColor : UIColor { get }
    
    var v2_LinkColor : UIColor { get }
    var v2_TextViewBackgroundColor: UIColor { get }
    var v2_CellWhiteBackgroundColor : UIColor { get }
    var v2_NodeBackgroundColor : UIColor { get }
    var v2_SeparatorColor : UIColor { get }
    var v2_LeftNodeBackgroundColor : UIColor { get }
    var v2_LeftNodeBackgroundHighLightedColor : UIColor { get }
    var v2_LeftNodeTintColor: UIColor { get }
    
    var v2_NoticePointColor : UIColor { get }
    var v2_ButtonBackgroundColor : UIColor { get }
}


class V2EXDefaultColor: NSObject,V2EXColorProtocol {
    
    static let sharedInstance = V2EXDefaultColor()
    fileprivate override init() {
      super.init()
    }
    
    var v2_backgroundColor : UIColor{
        get{
            return colorWith255RGB(242, g: 243, b: 245);
        }
    }
    var v2_navigationBarTintColor : UIColor{
        get{
            return colorWith255RGB(102, g: 102, b: 102);
        }
    }
    
    
    var v2_TopicListTitleColor : UIColor{
        get{
            return colorWith255RGB(15, g: 15, b: 15);
        }
    }
    
    var v2_TopicListUserNameColor : UIColor{
        get{
            return colorWith255RGB(53, g: 53, b: 53);
        }
    }
    
    var v2_TopicListDateColor : UIColor{
        get{
            return colorWith255RGB(173, g: 173, b: 173);
        }
    }
    
    var v2_LinkColor : UIColor {
        get {
            return colorWith255RGB(119, g: 128, b: 135)
        }
    }
    
    var v2_TextViewBackgroundColor :UIColor {
        get {
            return colorWith255RGB(255, g: 255, b: 255)
        }
    }
    
    var v2_CellWhiteBackgroundColor :UIColor {
        get {
            return colorWith255RGB(255, g: 255, b: 255)
        }
    }
    
    var v2_NodeBackgroundColor : UIColor {
        get {
            return colorWith255RGB(242, g: 242, b: 242)
        }
    }
    var v2_SeparatorColor : UIColor {
        get {
            return colorWith255RGB(190, g: 190, b: 190)
        }
    }
    
    var v2_LeftNodeBackgroundColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 76)
        }
    }
    var v2_LeftNodeBackgroundHighLightedColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 56)
        }
    }
    var v2_LeftNodeTintColor : UIColor {
        get {
            return colorWith255RGBA(0, g: 0, b: 0, a: 140)
        }
    }
    
    var v2_NoticePointColor : UIColor {
        get {
            return colorWith255RGB(207, g: 70, b: 71)
        }
    }
    var v2_ButtonBackgroundColor : UIColor {
        get {
            return colorWith255RGB(85, g: 172, b: 238)
        }
    }
}

class V2EXDarkColor: NSObject,V2EXColorProtocol{
  static let sharedInstance = V2EXDarkColor()
    fileprivate override init(){
      super.init()
    }
    var v2_backgroundColor : UIColor{
        get{
            return colorWith255RGB(32, g: 31, b: 35);
        }
    }
    var v2_navigationBarTintColor : UIColor{
        get{
            return colorWith255RGB(165, g: 165, b: 165);
        }
    }
    
    
    var v2_TopicListTitleColor : UIColor{
        get{
            return colorWith255RGB(145, g: 145, b: 145);
        }
    }
    
    var v2_TopicListUserNameColor : UIColor{
        get{
            return colorWith255RGB(125, g: 125, b: 125);
        }
    }
    
    var v2_TopicListDateColor : UIColor{
        get{
            return colorWith255RGB(100, g: 100, b: 100);
        }
    }
    
    var v2_LinkColor : UIColor {
        get {
            return colorWith255RGB(119, g: 128, b: 135)
        }
    }
    
    var v2_TextViewBackgroundColor :UIColor {
        get {
            return colorWith255RGB(35, g: 34, b: 38)
        }
    }
    
    var v2_CellWhiteBackgroundColor :UIColor {
        get {
            return colorWith255RGB(35, g: 34, b: 38)
        }
    }
    
    var v2_NodeBackgroundColor : UIColor {
        get {
            return colorWith255RGB(40, g: 40, b: 40)
        }
    }
    var v2_SeparatorColor : UIColor {
        get {
            return colorWith255RGB(46, g: 45, b: 49)
        }
    }
    
    var v2_LeftNodeBackgroundColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 76)
        }
    }
    var v2_LeftNodeBackgroundHighLightedColor : UIColor {
        get {
            return colorWith255RGBA(255, g: 255, b: 255, a: 56)
        }
    }
    var v2_LeftNodeTintColor : UIColor {
        get {
            return colorWith255RGBA(0, g: 0, b: 0, a: 140)
        }
    }
    
    var v2_NoticePointColor : UIColor {
        get {
            return colorWith255RGB(207, g: 70, b: 71)
        }
    }
    var v2_ButtonBackgroundColor : UIColor {
        get {
            return colorWith255RGB(207, g: 70, b: 71)
        }
    }

}

//class V2EXColor : NSObject {
//   fileprivate static let STYLE_KEY = "styleKey"
//    
//    static let V2EXColorStyleDefault = "Default"
//    static let V2EXColorStyleDark = "Dark"
//    
//    fileprivate static var _colors: V2EXColorProtocol?
//    
//    static var colors: V2EXColorProtocol {
//        get{
//            if let c = V2EXColor._colors{
//              return c
//
//            }else{
//              if V2EXColor.sharedInstance.style
//            }
//        }
//    }
//    
//    dynamic var style:String
//    static let sharedInstance = V2EXColor()
//    fileprivate override init() {
//     if let style =
//    }
//}

//extension NSObject {
//    fileprivate struct AssociatedKeys {
//    static var thmemChanged = "thmemChanged"
//    }
//    
//    public typealias ThemeChangedClosure = @convention(block) (_ style: String) -> Void
//    var thmemChangedHandler: ThemeChangedClosure? {
//        get {
//            let closureObject: AnyObject? = objc_getAssociatedObject(self, &AssociatedKeys.thmemChanged) as AnyObject?
//            guard closureObject != nil else {
//              return nil
//            }
//            let closure = unsafeBitCast(closureObject, to: ThemeChangedClosure.self)
//            return closure
//        }
//        set {
//            guard let value = newValue else {
//              return
//            }
//            let dealObject: AnyObject =  unsafeBitCast(value, to: AnyObject.self)
//            objc_setAssociatedObject(self, &AssociatedKeys.thmemChanged, dealObject, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            
//        }
//    }
//}
