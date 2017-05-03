//
//  V2Response.swift
//  ZZV2ex
//
//  Created by ios on 2017/5/3.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

class V2Response: NSObject {

    var success: Bool = false
    var message: String = "No message"
    init(success:Bool,message:String?) {
        super.init()
        self.success = success
        if let message = message{
          self.message = message
        }
    }
    init(success:Bool) {
        super.init()
        self.success = success
    }
}

class V2ValueResponse<T>: V2Response {
    var value:T?
    
    override init(success: Bool) {
        super.init(success: success)
    }
    override init(success: Bool,message:String?) {
        super.init(success: success)
            if let message = message {
               self.message = message
            }
        }
         convenience init(value:T,success:Bool){
            self.init(success: success)
            self.value = value
        }
        convenience init(value:T,success:Bool,message:String?) {
            self.init(value:value,success:success)
            if let message = message{
              self.message = message
            }
        
    }
}
