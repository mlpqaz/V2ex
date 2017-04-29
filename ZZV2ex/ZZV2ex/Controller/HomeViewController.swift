//
//  HomeViewController.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/29.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  let  cellID = "cellId";
    fileprivate var _tableView :UITableView!
//    fileprivate var tableView: UITableView {
//      get{
//        
//        if (_tableView != nil) {
//            return _tableView!;
//        }
        //_tableView = UITableView();
       // _tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        
     
       // _tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
  
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
       // return _tableView!;
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        _tableView = UITableView();
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    self.navigationItem.title = "V2EX";
        
        self.view.backgroundColor = UIColor.blue
        self.setupNavigationItem()
        _tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        self.view.addSubview(self._tableView);
        self._tableView.snp.makeConstraints{ (make) -> Void in
            make.top.right.bottom.left.equalTo(self.view);
        }
        _tableView.reloadData()
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

}


extension HomeViewController:UITableViewDataSource,UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier:cellID, for: indexPath)
        cell.backgroundColor = UIColor.red;
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
