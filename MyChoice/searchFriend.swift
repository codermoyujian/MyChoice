//
//  searchFriend.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/6/2.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class searchFriend:UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet var search:UISearchBar?
    @IBOutlet var table:UITableView?
    var array:NSMutableArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        search?.delegate = self
        table?.dataSource = self
        table?.delegate = self
        array = NSMutableArray()
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search?.resignFirstResponder()
        if(searchBar.text == "moyujian"){
            array?.removeAllObjects()
            array?.addObject("moyujian")
            table?.reloadData()
        }else if searchBar.text == "coder"{
            array?.removeAllObjects()
            array?.addObject("coder")
            table?.reloadData()
        }else{
            array?.removeAllObjects()
            table?.reloadData()
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.imageView?.image = UIImage(named: "firststeps")
        cell.textLabel?.text = array!.objectAtIndex(0) as! String
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array!.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var alert = UIAlertController(title: "添加好友？", message: "", preferredStyle: UIAlertControllerStyle.Alert) as UIAlertController
        var action = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) -> Void in
            for s in model.friends{
                if(s as! NSString).isEqualToString(self.search!.text){
                    return
                }
            }
            model.friends.addObject(self.search!.text)
        })
        alert.addAction(action)
        action = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}