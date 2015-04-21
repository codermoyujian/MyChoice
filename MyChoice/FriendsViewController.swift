//
//  FriendViewController.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/1/31.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class FriendsViewController: UITableViewController {

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
        return 50
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("FriendDetailCell") as UITableViewCell?
        cell?.textLabel?.text = ""
        cell?.detailTextLabel?.text = ""
        return cell!
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "FriendsGroup")
//        if section == 0{
//        cell.textLabel?.text = ""}
//        else{
//            cell.textLabel?.text = ""
//        }
//        return cell
//    }
//    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
}