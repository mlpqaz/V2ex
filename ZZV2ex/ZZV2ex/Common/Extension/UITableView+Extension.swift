//
//  UITableView+Extension.swift
//  ZZV2ex
//
//  Created by ios on 2017/4/30.
//  Copyright © 2017年 张璋. All rights reserved.
//

import UIKit


func regClass(_ tableView:UITableView , cell: AnyClass) -> Void {
    tableView.register(cell, forCellReuseIdentifier: "\(cell)");
}



func getCell<T: UITableViewCell>(_ tableView:UITableView , cell: T.Type , indexPath: IndexPath) -> T {
    return tableView.dequeueReusableCell(withIdentifier: "\(cell)", for:indexPath) as! T;
}
