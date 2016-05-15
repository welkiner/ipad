//
//  ViewController.swift
//  ipad
//
//  Created by tl on 16/5/12.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    
    @IBOutlet weak var leftBtnView: ImageButton!
    @IBOutlet weak var rightBtnView: ImageButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var oneAnswer = Answer()
    
    var currentIndex = 0 {
        didSet {
            leftBtnView.titleLabel.text = currentIndex == 0 ? "返  回" : "上一题"
            rightBtnView.titleLabel.text = currentIndex == answer.count-1 ? "提  交" : "下一题"
            switch currentIndex {
            case 0:
                rightBtnView.btn.enabled = oneAnswer.one.canGoNext()
                oneAnswer.two.cleanData()
            case 1:
                rightBtnView.btn.enabled = oneAnswer.two.canGoNext()
                oneAnswer.three.cleanData()
            case 2:
                rightBtnView.btn.enabled = oneAnswer.three.canGoNext()
                oneAnswer.four.cleanData()
            case 3:
                rightBtnView.btn.enabled = oneAnswer.four.canGoNext()
                
            default:
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
    func configUI() {
        currentIndex = 0
        self.reload()
        leftBtnView.btn.addTarget(self, action: #selector(leftBtnClick), forControlEvents: .TouchUpInside)
        rightBtnView.btn.addTarget(self, action: #selector(rightBtnClick), forControlEvents: .TouchUpInside)
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func leftBtnClick() {
        guard currentIndex != 0 else{
            self.navigationController?.popViewControllerAnimated(true)
            return
        }
        currentIndex -= 1
        self.reload()
    }
    
    func rightBtnClick() {
        if currentIndex == 4 {
            self.navigationController?.popViewControllerAnimated(true)
            return
        }
        if currentIndex == 3 {
            self.backgroundImageView.image = UIImage(named: "感谢参与示意")
            self.view.bringSubviewToFront(self.backgroundImageView)
            currentIndex += 1
            oneAnswer.store()
            return
        }
        
        currentIndex += 1
        self.reload()
    }
    func reload() {
        contentTitle.text = titles[currentIndex]
        tableView.reloadData()
    }
}

let titles = ["1、您更关注呼吸机的哪些使用特点?\n    （可多选）",
              "2、除Getinge Group的Maquet品牌外，\n     您对其他哪个品牌的呼吸机最满意？",
              "3、您最满意Getinge Group的哪项服务？",
              "4、您觉得Getinge Group有哪些服务最需要改进？"]

let answer = [["A：操作简单","B：性能稳定","C：感染控制","D：最新技术"],
              ["A：Drager","B：PB","C：Hamilton","D：Carefusion","E：MIndray","F：其他"],
              ["A：售后维修","B：临床培训","C：定期随访","D：都满意","E：都不满意"],
              ["A：售后维修","B：临床培训","C：定期随访","D：都需要改进"]]

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer[currentIndex].count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tempIndex = NSIndexPath(forRow: indexPath.row, inSection: currentIndex)
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        cell.textLabel!.text = answer[currentIndex][indexPath.row]
        cell.textLabel!.font = UIFont.systemFontOfSize(30)
        switch currentIndex {
        case 0:
            cell.accessoryType = tempIndex == oneAnswer.one.choosedIndexs() ?.Checkmark : .None
        case 1:
            cell.accessoryType = tempIndex == oneAnswer.two.choosedIndexs() ?.Checkmark : .None
        case 2:
            cell.accessoryType = tempIndex == oneAnswer.three.choosedIndexs() ?.Checkmark : .None
        case 3:
            cell.accessoryType = tempIndex == oneAnswer.four.choosedIndexs() ?.Checkmark : .None
        default:
            break
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch currentIndex {
        case 0:
            oneAnswer.one.cleanData()
            oneAnswer.one.choose(indexPath.row)
        case 1:
            oneAnswer.two.cleanData()
            oneAnswer.two.choose(indexPath.row)
        case 2:
            oneAnswer.three.cleanData()
            oneAnswer.three.choose(indexPath.row)
        case 3:
            oneAnswer.four.cleanData()
            oneAnswer.four.choose(indexPath.row)
        default:
            break
        }
        tableView.reloadData()
        let a = currentIndex
        currentIndex = a
    }
}

func == (left: NSIndexPath,right: [NSIndexPath]) -> Bool {
    for index in right {
        if (left.row == index.row) && (left.section == index.section) {
            return true
        }
    }
    return false
}

