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
    /// 装上面定义的那些元素的容器
    var contentPanel:UIView = UIView()
    
    var itemModel:TopicListModel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() -> Void {
        self.contentView.addSubview(self.contentPanel);
        self.contentPanel.addSubview(self.avatarImageView);
        self.contentPanel.addSubview(self.userNameLable);
        self.contentPanel.addSubview(self.dateAndLastPostUserLabel);
        self.contentPanel.addSubview(self.replyCountLabel);
        self.contentPanel.addSubview(self.replyCountIconImageView);
        self.contentPanel.addSubview(self.nodeBackgroundImageView);
        self.contentPanel.addSubview(self.nodeNameLabel);
        self.contentPanel.addSubview(self.topicTitleLabel);
        
        self.setupLayout()
    }
    
    fileprivate func setupLayout(){
        self.contentPanel.snp.makeConstraints{ (make) -> Void in
            make.top.left.right.equalTo(self.contentView);
        }
        self.avatarImageView.snp.makeConstraints{ (make) -> Void in
            make.left.top.equalTo(self.contentView).offset(12);
            make.width.height.equalTo(35);
            
        }
        self.userNameLable.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(self.avatarImageView.snp.right).offset(10);
            make.top.equalTo(self.avatarImageView);
        }
        self.dateAndLastPostUserLabel.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.avatarImageView);
            make.left.equalTo(self.userNameLable);
        }
        self.replyCountLabel.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.userNameLable);
            make.right.equalTo(self.contentPanel).offset(12);
        }
        self.replyCountIconImageView.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.replyCountLabel);
            make.width.height.equalTo(18);
            make.right.equalTo(replyCountLabel.snp.left).offset(-2);
        }
        
        self.nodeNameLabel.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.replyCountLabel);
            make.right.equalTo(self.replyCountIconImageView.snp.left).offset(-9)
            make.bottom.equalTo(self.replyCountLabel).offset(1);
            make.top.equalTo(self.replyCountLabel).offset(-1);
        }
        self.nodeBackgroundImageView.snp.makeConstraints{ (make) -> Void in
          make.top.bottom.equalTo(self.nodeNameLabel)
            make.left.equalTo(self.nodeNameLabel).offset(-5)
            make.right.equalTo(self.nodeNameLabel).offset(5)
        }
        self.contentPanel.snp.makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-8);
        }
        
    }
    
    func superBind(_ model: TopicListModel) {
        self.userNameLable.text = model.userName;
        if let layout = model.topicTitleLayout {
            if layout.text.string == self.itemModel?.topicTitleLayout?.text.string {
            return
            
            }else{
              self.topicTitleLabel.textLayout = layout
            }
        }
        if let avata = model.avata {
            self.avatarImageView.fin_setImageWithUrl(URL(string: "https:" + avata)!, placeholderImage: nil,imageModificationClosure: fin_defaultImageModification() )
        }
        self.replyCountLabel.text = model.replies;
        self.itemModel = model
        
    }
    func bind(_ model:TopicListModel) {
       self.superBind(model)
        self.dateAndLastPostUserLabel.text = model.date
        self.nodeNameLabel.text = model.nodeName
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
