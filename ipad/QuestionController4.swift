//
//  QuestionController4.swift
//  ipad
//
//  Created by tian.liang on 2017/7/20.
//  Copyright © 2017年 welkiner. All rights reserved.
//

import UIKit

class QuestionController4: UIViewController {
    @IBOutlet weak var BtnA: SimulateBtn!
    @IBOutlet weak var BtnB: SimulateBtn!
    @IBOutlet weak var BtnC: SimulateBtn!
    @IBAction func backBtnClick(_ sender: PageBtn) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtnClick(_ sender: PageBtn) {
        self.navigationController?.pushViewController(controller("QuestionController5"), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
