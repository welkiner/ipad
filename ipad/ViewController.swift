//
//  ViewController.swift
//  ipad
//
//  Created by tl on 16/5/12.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentTitle: UILabel!
    
    @IBOutlet weak var leftBtnView: ImageButton!
    @IBOutlet weak var rightBtnView: ImageButton!
    
    var currentIndex = 0 {
        didSet {
            leftBtnView.titleLabel.text = currentIndex == 0 ? "返  回" : "上一题"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
    func configUI() {
        currentIndex = 0
        leftBtnView.btn.addTarget(self, action: #selector(leftBtnClick), forControlEvents: .TouchUpInside)
    }
    @objc func leftBtnClick() {
        guard currentIndex != 0 else{
            self.navigationController?.popViewControllerAnimated(true)
            return
        }
        
    }
}

extension ViewController{
    
}

