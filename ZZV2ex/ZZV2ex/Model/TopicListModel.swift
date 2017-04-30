//
//  TopicListModel.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/30.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit
import Ji
import YYText

class TopicListModel: NSObject{
    var topicId: String?
    var avata: String?
    var nodeName: String?
    var userName: String?
    var topicTitle: String?
    var topicTitleAttributedString: NSMutableAttributedString?
    var topicTitleLayout: YYTextLayout?
    
    var date: String?
    var lastReplyUserName: String?
    var replies: String?
    
    var hits: String?
    
    override init() {
       super.init()
    }
    
    init(rootNode: JiNode) {
        super.init()
        
        self.avata = rootNode.xPath("./table/tr/td[1]/a[1]/img[@class='avatar']").first?["src"]
        self.nodeName = rootNode.xPath("./table/tr/td[3]/span[1]/a[1]").first?.content
       
        self.userName = rootNode.xPath("./table/tr/td[3]/span[1]/strong[1]/a[1]").first?.content
        let node = rootNode.xPath("./table/tr/td[3]/span[2]/a[1]").first
        self.topicTitle = node?.content
        
        //
        
        var topicIdUrl = node?["href"];
        if var id = topicIdUrl {
            if let range = id.range(of: "/t/") {
                id.replaceSubrange(range, with: "");
            }
            if let range = id.range(of: "#") {
              id = id.substring(to:  range.lowerBound)
                topicIdUrl = id
            }
        }
        
        self.topicId = topicIdUrl
        self.date = rootNode.xPath("./table/tr/td[3]/span[3]").first?.content
        
        var lastReplyUserName: String? = nil
        if let lastReplyUser = rootNode.xPath("./table/tr/td[3]/span[3]/strong[1]/a[1]").first{
          lastReplyUserName = lastReplyUser.content
        }
        self.lastReplyUserName = lastReplyUserName
        var replies:String? = nil;
        if let reply = rootNode.xPath("./table/tr/td[4]/a[1]").first {
          replies = reply.content
        }
        self.replies = replies
        
    }
    
}
