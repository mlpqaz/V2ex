//
//  HomeTopicListTableViewCell.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit
import YYText

class HomeTopicListTableViewCell: UITableViewCell {

     /// 节点信息label的圆角背景图
    
    fileprivate static var nodeBackgroundImage_Default = createImageWithColor(V2EXDefaultColor.sharedInstance.v2_NodeBackgroundColor, size: CGSize(width: 10, height: 20)).roundedCornerImageWithCornerRadius(2).stretchableImage(withLeftCapWidth: 3, topCapHeight: 3)
    
    fileprivate static var nodeBackgroundImage_Dark = createImageWithColor(V2EXDarkColor.sharedInstance.v2_NodeBackgroundColor, size: CGSize(width: 10, height: 20)).roundedCornerImageWithCornerRadius(2).stretchableImage(withLeftCapWidth: 3, topCapHeight: 3)
    
    
 /// 头像
    var avatarImageView: UIImageView = {
       let imageview = UIImageView()
        imageview.contentMode = UIViewContentMode.scaleAspectFit
        return imageview
    }()
    
  /// 用户名
    
    var userNameLable: UILabel = {
    let label = UILabel()
        label.font = v2Font(14)
        return label;
    }()
    
     /// 日期 和 最后发送人
    
    var dateAndLastPostUserLabel: UILabel = {
    let label = UILabel()
        label.font = v2Font(12)
        return label
    }()
     /// 评论数量
    
    var replyCountLabel: UILabel = {
       let label = UILabel()
        label.font = v2Font(12)
        return label
    }()
    
    var replyCountIconImageView: UIImageView = {
        let imageview  = UIImageView(image: UIImage(named: "reply_n"))
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    /// 节点
    var nodeNameLabel: UILabel = {
        let label = UILabel();
        label.font = v2Font(11)
        return label
    }()
    var nodeBackgroundImageView: UIImageView = UIImageView()
    /// 帖子标题
    var topicTitleLabel: YYLabel = {
      let label = YYLabel()
        label.textVerticalAlignment = .top
        label.font = v2Font(18)
        label.displaysAsynchronously = true
       label.numberOfLines = 0
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
