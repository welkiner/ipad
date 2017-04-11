//
//  ResultViewController.swift
//  ipad
//
//  Created by tian.liang on 16/5/13.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController,UIAlertViewDelegate{
    
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (_, label) in labels.enumerated() {
            label.text = String(UserDefaults.standard.integer(forKey: String(label.tag)))
        }
        countLabel.text = String(UserDefaults.standard.integer(forKey: "count"))
        // Do any additional setup after loading the view.
    }
    @IBAction func clearBtnClick(_ sender: UIButton) {
        let alert = UIAlertView.init(title: "确定要清空么", message: "", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        alert.show()
    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        guard buttonIndex == 1 else {return}

        for (_, label) in labels.enumerated() {
            UserDefaults.standard.set(0, forKey: String(label.tag))
            label.text = "0"
        }
        UserDefaults.standard.set(0, forKey: "count")
        countLabel.text = "0"
        
        UserDefaults.standard.synchronize()
    }

    @IBAction func backBtnClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
