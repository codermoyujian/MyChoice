//
//  NewChoiceVC.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/2/8.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class NewChoiceVC: UITableViewController,UITextViewDelegate {
    @IBOutlet var describeView:UITextView?
    @IBAction func fabu(){
        var dateString = NSDate().description
        dateString = dateString.componentsSeparatedByString(" ")[0] as! String
        model.all++
        model.common++
        model.date = dateString
        var temp = NSMutableArray()
        temp.addObject(describeView!.text)
        temp.addObject(dateString)
        temp.addObject("b")
        model.data.addObject(temp)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        describeView?.delegate = self
        describeView?.returnKeyType = UIReturnKeyType.Done
    }
    override func viewWillAppear(animated: Bool) {
        if model.date.isEqualToString(""){
            tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0))?.textLabel?.text = "时间(默认今天）"
        }else{
            var date = NSString(string: model.date).componentsSeparatedByString(" ")[0]
            tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0))?.textLabel?.text = date as! String
        }
    }
    func textViewDidBeginEditing(textView: UITextView) {
        describeView?.text = ""
    }
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            describeView?.resignFirstResponder()
            return false
        }
        return true
    }
}