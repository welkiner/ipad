//
//  ViewController.swift
//  ipad
//
//  Created by tian.liang on 2017/7/19.
//  Copyright © 2017年 welkiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnClick(_ sender: UIButton) {
        self.navigationController?.pushViewController(controller("HomeController2"), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

