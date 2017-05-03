//
//  HomeViewController.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit
import SnapKit
import Ji

class HomeViewController: UIViewController {
    
    var topicList:Array<TopicListModel>?
    var tab:String? = nil
    var currentPage = 0
    
  let  cellID = "cellId";
    fileprivate var _tableView :UITableView!
    fileprivate var tableView: UITableView {
      get{
        
        if (_tableView != nil) {
            return _tableView!;
        }
        _tableView = UITableView();
       // _tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        
     
       // _tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
  
        regClass(_tableView, cell: HomeTopicListTableViewCell.self)
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        return _tableView!;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    self.navigationItem.title = "V2EX";
        
        self.view.backgroundColor = UIColor.blue
        self.setupNavigationItem()
     
        
        self.view.addSubview(self.tableView);
        self.tableView.snp.makeConstraints{ (make) -> Void in
            make.top.right.bottom.left.equalTo(self.view);
        }
       
    }

    func setupNavigationItem() {
        let leftButton = NotificationMenuButton()
        leftButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:leftButton)
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightButton.contentMode = .center
        rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15)
        rightButton.setImage(UIImage.imageUserdTemplateMode("ic_more_horiz_36pt")!.withRenderingMode(.alwaysTemplate), for: UIControlState())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView:rightButton)
       
    }

    func refresh(){
        if self.tableView.mj_footer.isRefreshing(){
          self.tableView.mj_footer.endRefreshing()
        }
        
        TopicListModel.getTopicList(tab){
            (response:V2ValueResponse<[TopicListModel]>) -> Void in
            
            if response.success {
                
                self.topicList = response.value
                self.tableView.reloadData()
                
          
                
            }
            self.tableView.mj_header.endRefreshing()
        }
    }
    
}


extension HomeViewController:UITableViewDataSource,UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.topicList{
          return list.count
        }
        return 0;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.topicList![indexPath.row]
        let titleHeight = item.topicTitleLayout?.textBoundingRect.size.height ?? 0
        let height = 12 + 35 + 12 + titleHeight + 12 + 8
        
        return height;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCell(tableView, cell: HomeTopicListTableViewCell.self, indexPath: indexPath);
        
        cell.bind(self.topicList![indexPath.row]);
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
