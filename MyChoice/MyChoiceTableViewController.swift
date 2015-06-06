//
//  MyChoiceTableViewController.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/1/28.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class MyChoiceTableViewController: UITableViewController {
    
    @IBOutlet var DecisionCell:UITableViewCell?
    @IBOutlet var TotalCell:UITableViewCell?
    func removeCellSeparator(){
        var temp = UIView()
        temp.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = temp
    }
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        removeCellSeparator()
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var viewHeight = tableView.bounds.height
        if indexPath.row == 0{
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("TotalCell") as? UITableViewCell
            if (cell == nil){
                NSBundle.mainBundle().loadNibNamed("TotalCell", owner: self, options: nil)
                cell = self.TotalCell
                TotalCell = nil
            }
            
            var temp:UILabel?
            temp = cell!.viewWithTag(1) as? UILabel
            temp?.text = NSString(format: "%d个选择", model.all) as String
            
            temp = cell!.viewWithTag(2) as? UILabel
            temp?.text = NSString(format: "%d开心", model.good) as String
            
            temp = cell!.viewWithTag(3) as? UILabel
            temp?.text = NSString(format: "%d悲伤", model.bad) as String
            var selectedColor = UIView()
            selectedColor.backgroundColor = UIColor.redColor()
            cell?.selectedBackgroundView = selectedColor
            return cell!
        }else{
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("DecisionCell") as? UITableViewCell
            if (cell == nil){
                NSBundle.mainBundle().loadNibNamed("DecisionCell", owner: self, options: nil)
                cell = self.DecisionCell
                DecisionCell = nil
            }
            var temp:UILabel?
            var tempIma = cell!.viewWithTag(1) as! UIImageView
            tempIma.image = UIImage(named: (model.data.objectAtIndex(indexPath.row - 1) as! NSArray).objectAtIndex(2) as! String)
            temp = cell!.viewWithTag(2) as? UILabel
            temp?.text = (model.data[indexPath.row - 1] as! NSArray)[0] as! String
            
            temp = cell?.viewWithTag(3) as? UILabel
            temp?.text = (model.data[indexPath.row - 1] as! NSArray)[1] as! String
            return cell!
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var alert = UIAlertController(title: "事后", message: "", preferredStyle: UIAlertControllerStyle.Alert) as UIAlertController
        var action = UIAlertAction(title: "开心", style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) -> Void in
            switch (model.data.objectAtIndex(indexPath.row - 1) as! NSArray).objectAtIndex(2) as! String{
            case "b":
                model.common--
                model.good++
                (model.data.objectAtIndex(indexPath.row - 1) as! NSMutableArray)[2] = "a"
            case "c":
                model.bad--
                model.good++
                (model.data.objectAtIndex(indexPath.row - 1) as! NSMutableArray)[2] = "a"
            default:
                break
            }
            tableView.reloadData()
        })
        alert.addAction(action)
        action = UIAlertAction(title: "一般", style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) -> Void in
            (self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: indexPath.row, inSection: 0))?.viewWithTag(1) as! UIImageView).image = UIImage(named: "b")
            switch (model.data.objectAtIndex(indexPath.row - 1) as! NSArray).objectAtIndex(2) as! String{
            case "a":
                model.good--
                model.common++
                (model.data.objectAtIndex(indexPath.row - 1) as! NSMutableArray)[2] = "b"
            case "c":
                model.bad--
                model.common++
                (model.data.objectAtIndex(indexPath.row - 1) as! NSMutableArray)[2] = "b"
            default:
                break
            }
            tableView.reloadData()
        })
        alert.addAction(action)
        action = UIAlertAction(title: "不开心", style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) -> Void in
            (self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: indexPath.row, inSection: 0))?.viewWithTag(1) as! UIImageView).image = UIImage(named: "c")
            switch (model.data.objectAtIndex(indexPath.row - 1) as! NSArray).objectAtIndex(2) as! String{
                case "a":
                    model.good--
                    model.bad++
                    (model.data.objectAtIndex(indexPath.row - 1) as! NSMutableArray)[2] = "c"
                case "b":
                    model.common--
                    model.bad++
                    (model.data.objectAtIndex(indexPath.row - 1) as! NSMutableArray)[2] = "c"
                default:
                    break
            }
            tableView.reloadData()
        })
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count + 1
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var viewHeight = tableView.bounds.height
        if indexPath.row == 0{
            return viewHeight / 2.7
        }else{
            return viewHeight / 9.5
        }
        
    }
}