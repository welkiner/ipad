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

        // Do any additional setup after loading the view.
    }
    @IBOutlet var labels: [UILabel]!
    @IBAction func clearDataClick(_ sender: SimulateBtn) {
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
