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
    override func viewDidLoad() {
        super.viewDidLoad()
        describeView?.delegate = self
        describeView?.returnKeyType = UIReturnKeyType.Done
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