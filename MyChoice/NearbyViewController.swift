//
//  NearbyViewController.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/2/3.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class NearbyViewController: UITableViewController {
    func removeCellSeparator(){
        var temp = UIView()
        temp.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = temp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeCellSeparator()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NearByCell") as! UITableViewCell?
        if cell == nil{
            cell = NearByCell(frame: CGRectMake(0, 0, 320, 400))
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return cell!
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    }
}