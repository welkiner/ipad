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
                rightBtnView.btn.isEnabled = oneAnswer.one.canGoNext()
            case 1:
                rightBtnView.btn.isEnabled = oneAnswer.two.canGoNext()
            case 2:
                rightBtnView.btn.isEnabled = oneAnswer.three.canGoNext()
            case 3:
                rightBtnView.btn.isEnabled = oneAnswer.four.canGoNext()
                
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
        leftBtnView.btn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        rightBtnView.btn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func leftBtnClick() {
        guard currentIndex != 0 else{
            self.navigationController?.popViewController(animated: true)
            return
        }
        currentIndex -= 1
        self.reload()
    }
    
    func rightBtnClick() {
        if currentIndex == 4 {
            self.navigationController?.popViewController(animated: true)
            return
        }
        if currentIndex == 3 {
            self.backgroundImageView.image = UIImage(named: "感谢参与示意")
            self.view.bringSubview(toFront: self.backgroundImageView)
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

let titles = ["1、贵医院在近期（1至2年）是否有以下计划：",
              "2、作为医院的手术室护士长或医务工作人员，您在选择手术灯时,最关心的问题是：",
              "3、作为医院的手术室护士长或医务工作人员，您在选择手术床时，最关心的问题是：",
              "4、作为医院的手术室护士长或医务工作人员，最希望得到厂家的哪方面的培训："]

let answer = [["A：建造全新的手术室或改造手术室",
               "B：建造或改造数字化手术室",
               "C：建造或改造复合（Hybrid OR）手术室",
               "D：增加或更换手术灯或者手术床",
               "E：近期无任何手术室设备更换计划"],
              
              ["A：手术灯的最大光亮度",
               "B：手术灯的光照深度",
               "C：手术灯的光斑直径（是否固定光斑或可调光斑）",
               "D：手术灯灯泡使用寿命",
               "E：手术灯的无影效果",
               "F：是否具有高清摄像系统（中置或旁置）"],
              
              ["A：手术床使用的稳定性（骨科、神外等）",
               "B：手术床的是否具有特殊优点（如手术床最低高度等)",
               "C：手术床是否具有水平移动功能",
               "D：手术床具有完整的各类手术床配件",
               "E：手术床使用的安全性"],
              
              ["A：手术床及手术灯操作培训",
               "B：手术床手术体位培训",
               "C：手术床或手术灯附件(配件)使用培训",
               "D：手术室工作流程及感控培训",
               "E：现代化手术室管理及最新手术室技术发展培训"]]

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer[currentIndex].count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempIndex = IndexPath(row: indexPath.row, section: currentIndex)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        cell!.backgroundColor = UIColor.clear
        cell!.textLabel!.text = answer[currentIndex][indexPath.row]
        cell!.textLabel!.font = UIFont.systemFont(ofSize: 26)
        switch currentIndex {
            case 0:
                cell!.textLabel?.textColor = tempIndex == oneAnswer.one.choosedIndexs() ? UIColor.blue : UIColor.black
            case 1:
                cell!.textLabel?.textColor = tempIndex == oneAnswer.two.choosedIndexs() ? UIColor.blue : UIColor.black
            case 2:
                cell!.textLabel?.textColor = tempIndex == oneAnswer.three.choosedIndexs() ? UIColor.blue : UIColor.black
            case 3:
                cell!.textLabel?.textColor = tempIndex == oneAnswer.four.choosedIndexs() ? UIColor.blue : UIColor.black
            default:
                break
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

func == (left: IndexPath,right: [IndexPath]) -> Bool {
    for index in right {
        if (left.row == index.row) && (left.section == index.section) {
            return true
        }
    }
    return false
}

