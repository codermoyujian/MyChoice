//
//  emptyCell.swift
//  Test
//
//  Created by 莫宇剑 on 15/2/16.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class NearByCell:UITableViewCell,UITableViewDataSource,UITableViewDelegate{
    var height:CGFloat?
    @IBAction func click(sender:UIButton){
        sender.backgroundColor = UIColor.blueColor()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        var image:UIImageView = UIImageView(frame: CGRectMake(8, 8, 50, 50))
        image.backgroundColor = UIColor.blueColor()
        self.addSubview(image)
        
        var name:UILabel = UILabel(frame: CGRectMake(66, 8, 160, 21))
        name.text = "coder莫"
        self.addSubview(name)
        
        var sign:UILabel = UILabel(frame: CGRectMake(66, 37, 160, 21))
        sign.text = "今天开始学swift"
        sign.font = UIFont(name: "Helvetica", size: 13)
        self.addSubview(sign)
        
        var time:UILabel = UILabel(frame: CGRectMake(250, 8, 63, 16))
        time.text = "2015-1-25"
        time.font = UIFont(name: "Helvetica", size: 12)
        self.addSubview(time)
        
        var describe:UITextView = UITextView(frame: CGRectMake(44, 66, 230, 40))
        describe.scrollEnabled = false
        describe.editable = false
        describe.selectable = false
        describe.text = "这是一个测试用的描述"
        describe.font = UIFont(name: "Helvetica", size: 14)
        self.addSubview(describe)
        
        var table:UITableView = UITableView(frame: CGRectMake(66, 120, 220, 170))
        table.scrollEnabled = false
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        table.delegate = self
        table.dataSource = self
        self.addSubview(table)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ChoiceCell") as?UITableViewCell
        if cell == nil{
            cell = (NSBundle.mainBundle().loadNibNamed("ChoiceCell", owner: self, options: nil) as NSArray).objectAtIndex(0) as? UITableViewCell
        }
        return cell!
    }
}