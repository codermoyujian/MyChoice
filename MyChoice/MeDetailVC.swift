//
//  MeDetailVC.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/2/8.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class MeDetailVC: UITableViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet var FaceIma: UITableViewCell?
    @IBOutlet var GXQM: UITableViewCell?
    @IBOutlet var Name: UITableViewCell?
    @IBOutlet var Sex:UITableViewCell?
    @IBOutlet var ttt:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        var selectedColor = UIView()
        selectedColor.backgroundColor = UIColor.blueColor()
        FaceIma?.selectedBackgroundView = selectedColor
        GXQM?.selectedBackgroundView = selectedColor
        Name?.selectedBackgroundView = selectedColor
        Sex?.selectedBackgroundView = selectedColor
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        var image = info[UIImagePickerControllerEditedImage] as UIImage
        ttt?.image = image
        //http need
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0{
            switch indexPath.row{
            //头像
            case 0:
                    var alert = UIAlertController(title: "选择头像", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
                    var action = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
                    alert.addAction(action)
                    action = UIAlertAction(title: "从相册获取", style: UIAlertActionStyle.Default, handler: {
                        (alertaction:UIAlertAction!) ->Void in
                        var IPC = UIImagePickerController()
                        IPC.delegate = self
                        IPC.allowsEditing = true
                        IPC.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
                        self.presentViewController(IPC, animated: true, completion: nil)
                    })
                    alert.addAction(action)
                    action = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(action)
                    FaceIma?.selected = false
                    self.presentViewController(alert, animated: true, completion: nil)
            //名称
            case 1:
                    var alert = UIAlertController(title: "名称", message: "", preferredStyle: UIAlertControllerStyle.Alert) as UIAlertController
                    var action = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler:nil)
                    alert.addAction(action)
                    action = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(action)
                    alert.addTextFieldWithConfigurationHandler{
                        (textField: UITextField!) -> Void in
                        textField.placeholder = "新名称"
                    }
                    Name?.selected = false
                    self.presentViewController(alert, animated: true, completion: nil)
            //性别
            case 2:
                var alert = UIAlertController(title: "性别", message: "", preferredStyle: UIAlertControllerStyle.Alert) as UIAlertController
                var action = UIAlertAction(title: "男", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(action)
                action = UIAlertAction(title: "女", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(action)
                Sex?.selected = false
                self.presentViewController(alert, animated: true, completion: nil)
            default:println()
            }
        }else if indexPath.section == 1{
            //个性签名
            var alert = UIAlertController(title: "个性签名", message: "", preferredStyle: UIAlertControllerStyle.Alert) as UIAlertController
            var action = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(action)
            action = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(action)
            alert.addTextFieldWithConfigurationHandler{
                (textField:UITextField!) -> Void in
                textField.placeholder = "个性签名"
            }
            GXQM?.selected = false
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}