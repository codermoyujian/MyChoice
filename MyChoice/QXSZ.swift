//
//  QXSZ.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/6/1.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class QXSZ:UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}