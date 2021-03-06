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
import Alamofire

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
        
        self.setupTitleLayout()
        
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
    
    init(favoritesRootNode:JiNode) {
        super.init()
        self.avata = favoritesRootNode.xPath("./table/tr/td[1]/a[1]/img[@class='avatar']").first?["src"]
        self.nodeName = favoritesRootNode.xPath("./table/tr/td[3]/span[2]/a[1]").first?.content
        self.userName = favoritesRootNode.xPath("./table/tr/td[3]/span[2]/strong[1]/a").first?.content
        
        let node = favoritesRootNode.xPath("./table/tr/td[3]/span/a[1]").first
        self.topicTitle = node?.content
        
        self.setupTitleLayout()
        
        var topicIdUrl = node?["href"];
        
        if var id = topicIdUrl {
            if let range = id.range(of: "/t/") {
                id.replaceSubrange(range, with: "");
            }
            if let range = id.range(of: "#") {
               id = id.substring(to: range.lowerBound)
                topicIdUrl = id
            }
        }
        self.topicId = topicIdUrl
        
        let date = favoritesRootNode.xPath("./table/tr/td[3]/span[2]").first?.content
        if let date = date {
           let array = date.components(separatedBy: "•")
            if array.count == 4 {
              self.date = array[3].trimmingCharacters(in: NSCharacterSet.whitespaces)
            }
            
        }
        self.lastReplyUserName = favoritesRootNode.xPath("./table/tr/td[3]/span[2]/strong[2]/a[1]").first?.content
        self.replies = favoritesRootNode.xPath("./table/tr/td[4]/a[1]").first?.content
    }
    
    init(nodeRootNode:JiNode) {
        super.init()
        self.avata = nodeRootNode.xPath("./table/tr/td[1]/a[1]/img[@class='avatar']").first?["src"]
        self.userName = nodeRootNode.xPath("./table/tr/td[3]/span[2]/strong").first?.content
        let node = nodeRootNode.xPath("./table/tr/td[3]/span/a[1]").first
        self.topicTitle = node?.content
        
        self.setupTitleLayout()
        
        var topicIdUrl = node?["href"];
        if var id = topicIdUrl {
            if let range = id.range(of: "/t/"){
                id.replaceSubrange(range, with: "");
        }
            if let range = id.range(of: "#") {
              id = id.substring(to: range.lowerBound)
                topicIdUrl = id
            }
    }
        self.topicId = topicIdUrl
        self.hits = nodeRootNode.xPath("./table/tr/td[3]/span[last()]/text()").first?.content
         if var hits = self.hits {
        
            hits = hits.substring(from: hits.index(hits.startIndex, offsetBy: 5))
            self.hits = hits
        }
        var replies: String? = nil;
        if let reply = nodeRootNode.xPath("./table/tr/td[4]/a[1]").first {
          replies = reply.content
        }
        self.replies = replies
    }
    
    func setupTitleLayout() {
        if let title = self.topicTitle {
            self.topicTitleAttributedString = NSMutableAttributedString(string:title,attributes: [NSFontAttributeName:v2Font(17),NSForegroundColorAttributeName:UIColor.red])
            self.topicTitleAttributedString?.yy_lineSpacing = 3
            
            self.thmemChangedHandler = { [weak self] (style) -> Void in
                if let str = self?.topicTitleAttributedString{
                  str.yy_color = V2EXColor.colors.v2_TopicListTitleColor
                    self?.topicTitleLayout = YYTextLayout(containerSize:CGSize(width: SCREEN_WIDTH - 24,height: 9999), text: str)
                }
            }
        }
    }

}

extension TopicListModel {
    class func getTopicList (_ tab: String? = nil ,page: Int = 0, completionHandler: @escaping (V2ValueResponse<[TopicListModel]>) -> Void) -> Void{
        var params:[String:String] = [:]
        if let tab = tab {
           params["tab"] = tab
        }else
        {
           params["tab"] = "all"
        }
        
        var url = V2EXURL
        if params["tab"] == "all" && page > 0 {
          params.removeAll()
            params["p"] = "\(page)"
            url = V2EXURL + "recent"
        }
        
        Alamofire.request(url, parameters: params, headers: MOBILE_CLIENT_HEADERS).responseJiHtml { (response) -> Void in
            var resultArray:[TopicListModel] = []
            if  let jiHtml = response.result.value{
                if let aRootNode = jiHtml.xPath("//body/div[@id='Wrapper']/div[@class='content']/div[@class='box']/div[@class='cell item']"){
                    for aNode in aRootNode {
                        let topic = TopicListModel(rootNode:aNode)
                        resultArray.append(topic);
                    }
                    
                }
                DispatchQueue.global().async {
               
                }
                
            }
            
            let t = V2ValueResponse<[TopicListModel]>(value:resultArray, success: response.result.isSuccess)
            completionHandler(t);
        }
    }

}
