//
//  HomeTopicListTableViewCell.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

class HomeTopicListTableViewCell: UITableViewCell {

     /// 节点信息label的圆角背景图
    
    fileprivate static var nodeBackgroundImage_Default = createImageWithColor(V2EXDefaultColor.sharedInstance.v2_NodeBackgroundColor, size: CGSize(width: 10, height: 20)).roundedCornerImageWithCornerRadius(2).stretchableImage(withLeftCapWidth: 3, topCapHeight: 3)
    
    fileprivate static var nodeBackgroundImage_Dark = createImageWithColor(V2EXDarkColor.sharedInstance.v2_NodeBackgroundColor, size: CGSize(width: 10, height: 20)).roundedCornerImageWithCornerRadius(2).stretchableImage(withLeftCapWidth: 3, topCapHeight: 3)
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
