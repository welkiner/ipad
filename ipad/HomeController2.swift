//
//  HomeController2.swift
//  ipad
//
//  Created by tian.liang on 2017/7/19.
//  Copyright © 2017年 welkiner. All rights reserved.
//

import UIKit

class HomeController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func beginBtnClicl(_ sender: SimulateBtn) {
        self.navigationController?.pushViewController(controller("QuestionController3"), animated: true)
    }
    @IBAction func endBtnClick(_ sender: SimulateBtn) {
        
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
