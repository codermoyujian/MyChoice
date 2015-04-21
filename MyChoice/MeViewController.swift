//
//  MeViewController.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/2/8.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class MeViewController: UITableViewController {
    @IBOutlet weak var FaceIma: UIImageView!
    @IBOutlet weak var GXQM: UILabel!
    @IBOutlet weak var Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FaceIma.image = UIImage(named:"msg_new")
        Name.text = "Arthur"
        GXQM.text = "今天开始学swift"
    }
}