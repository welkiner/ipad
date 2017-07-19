//
//  SimulateBtn.swift
//  ipad
//
//  Created by tian.liang on 2017/7/20.
//  Copyright © 2017年 welkiner. All rights reserved.
//

import UIKit

@IBDesignable
class SimulateBtn: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    override func awakeFromNib() {
        
    }
//    @IBInspectable
//    var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
