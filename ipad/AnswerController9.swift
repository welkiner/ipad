//
//  AnswerController9.swift
//  ipad
//
//  Created by tian.liang on 2017/7/20.
//  Copyright © 2017年 welkiner. All rights reserved.
//

import UIKit

class AnswerController9: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for (_, label) in labels.enumerated() {
            label.text = String(UserDefaults.standard.integer(forKey: String(label.tag-100)))
        }
        countLabel.text = String(UserDefaults.standard.integer(forKey: "count"))
    }
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet var labels: [UILabel]!
    @IBAction func clearDataClick(_ sender: SimulateBtn) {
        let vc = UIAlertController.init(title: "提示", message: "确定要清空数据么？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            for (_, label) in self.labels.enumerated() {
                UserDefaults.standard.set(0, forKey: String(label.tag))
                label.text = "0"
            }
            UserDefaults.standard.set(0, forKey: "count")
            self.countLabel.text = "0"
            
            UserDefaults.standard.synchronize()
        })
        vc.addAction(cancelAction)
        vc.addAction(okAction)
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func nextClick(_ sender: SimulateBtn) {
        self.navigationController?.pushViewController(controller("ThanksController10"), animated: true)
    }
    @IBAction func backClick(_ sender: SimulateBtn) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
