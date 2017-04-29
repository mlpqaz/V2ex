//
//  V2EXNavigationController.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

class V2EXNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.setStatusBarStyle(.default, animated: true);
        self.navigationBar.setBackgroundImage(createImageWithColor(UIColor.clear), for: .default)
    }

    

}
