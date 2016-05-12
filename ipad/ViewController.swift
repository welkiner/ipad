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
            rightBtnView.titleLabel.text = currentIndex == 3 ? "提  交" : "下一题"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
    func configUI() {
        currentIndex = 0
        leftBtnView.btn.addTarget(self, action: #selector(leftBtnClick), forControlEvents: .TouchUpInside)
        rightBtnView.btn.addTarget(self, action: #selector(rightBtnClick), forControlEvents: .TouchUpInside)
    }
    func leftBtnClick() {
        guard currentIndex != 0 else{
            self.navigationController?.popViewControllerAnimated(true)
            return
        }
        currentIndex -= 1
    }
    
    func rightBtnClick() {
        if currentIndex == 3 {
            self.navigationController?.popViewControllerAnimated(true)
            return
        }
        currentIndex += 1
    }
}

let titles = ["1、您更关注呼吸机的哪些使用特点?\n（可多选）",
              "2、除Getinge Group的Maquet品牌外，\n您对其他哪个品牌的呼吸机最满意？",
              "3、您最满意Getinge Group的哪项服务？",
              "4、您觉得Getinge Group有哪些服务最需要改进？"]

let answer = [["A：操作简单","B：性能稳定","C：感染控制","D：最新技术"],
              ["A：Drager","B：PB","C：Hamilton","D：Carefusion","E：MIndray","F：其他"],
              ["A：售后维修","B：临床培训","C：定期随访","D：都满意","E：都不满意"],
              ["A：售后维修","B：临床培训","C：定期随访","都需要改进"]]

extension ViewController{
    
}

