//
//  DataPicker.swift
//  MyChoice
//
//  Created by 莫宇剑 on 15/6/1.
//  Copyright (c) 2015年 莫宇剑. All rights reserved.
//

import Foundation
import UIKit
class DataPicker:UIViewController{
    @IBAction func back(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func data(dataPicker:UIDatePicker){
        model.date = dataPicker.date.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}