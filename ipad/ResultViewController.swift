//
//  ResultViewController.swift
//  ipad
//
//  Created by tian.liang on 16/5/13.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var labels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(labels.debugDescription)")
        // Do any additional setup after loading the view.
    }
    @IBAction func clearBtnClick(sender: UIButton) {
        
    }

    @IBAction func backBtnClick(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
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
