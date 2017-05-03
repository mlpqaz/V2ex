//
//  V2RefreshHeader.swift
//  ZZV2ex
//
//  Created by ios on 2017/5/3.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit
import MJRefresh

class V2RefreshHeader: MJRefreshHeader {
    var loadingView:UIActivityIndicatorView?
    var arrowImage:UIImageView?
    
    override var state: MJRefreshState{
    
        didSet{
            switch state {
            case .idle:
                self.loadingView?.isHidden = true
                self.arrowImage?.isHidden = false
                self.loadingView?.stopAnimating()
            case .pulling:
                self.loadingView?.isHidden = false
                self.arrowImage?.isHidden = true
                self.loadingView?.startAnimating()
            case .refreshing:
                self.loadingView?.isHidden = false
                self.arrowImage?.isHidden = true
                self.loadingView?.startAnimating()
                
            default:
               
                NSLog("")
            }
        }

    }
}
