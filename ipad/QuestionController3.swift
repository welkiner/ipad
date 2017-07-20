//
//  QuestionController3.swift
//  ipad
//
//  Created by tian.liang on 2017/7/20.
//  Copyright © 2017年 welkiner. All rights reserved.
//

import UIKit

class QuestionController3: UIViewController {
    @IBOutlet weak var BtnA: SimulateBtn!
    @IBOutlet weak var BtnB: SimulateBtn!
    @IBOutlet weak var BtnC: SimulateBtn!
    
    var answer = Answer()
    
    @IBAction func backBtnClick(_ sender: PageBtn) {
        self.answer.one.cleanData()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtnClick(_ sender: PageBtn) {
        if !self.answer.one.canGoNext() {
            return
        }
        let vc = controller("QuestionController4") as! QuestionController4
        vc.answer = answer
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BtnA.addTarget(self, action: #selector(btnAClick), for: .touchUpInside)
        self.BtnB.addTarget(self, action: #selector(btnBClick), for: .touchUpInside)
        self.BtnC.addTarget(self, action: #selector(btnCClick), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    func btnAClick() {
        self.BtnA.isEnabled = false
        self.BtnB.isEnabled = true
        self.BtnC.isEnabled = true
        self.answer.one.cleanData()
        self.answer.one.choose(0)
    }
    func btnBClick() {
        self.BtnA.isEnabled = true
        self.BtnB.isEnabled = false
        self.BtnC.isEnabled = true
        self.answer.one.cleanData()
        self.answer.one.choose(1)
    }
    func btnCClick() {
        self.BtnA.isEnabled = true
        self.BtnB.isEnabled = true
        self.BtnC.isEnabled = false
        self.answer.one.cleanData()
        self.answer.one.choose(2)
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
