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
            temp?.text = "0个选择"
            
            temp = cell!.viewWithTag(2) as? UILabel
            temp?.text = "0开心"
            
            temp = cell!.viewWithTag(3) as? UILabel
            temp?.text = "0悲伤"
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
            var selectedColor = UIView()
            selectedColor.backgroundColor = UIColor.cyanColor()
            cell?.selectedBackgroundView = selectedColor
            var temp:UILabel?
            var tempIma = cell!.viewWithTag(1) as UIImageView
            tempIma.image = UIImage(named: "firststeps")
            
            temp = cell!.viewWithTag(2) as? UILabel
            temp?.text = "我开始学习swift"
            
            temp = cell?.viewWithTag(3) as? UILabel
            temp?.text = "2015-01-24"
            return cell!
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var choiceDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChoiceDetailViewController") as UIViewController
        self.navigationController?.pushViewController(choiceDetailVC, animated: true)
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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