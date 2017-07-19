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
            backgroundColor = UIColor.red.withAlphaComponent(0.4)
        }
    }
    override func awakeFromNib() {
        
    }
}
@IBDesignable
class PageBtn: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            backgroundColor = UIColor.red.withAlphaComponent(0.4)
        }
    }
    override func awakeFromNib() {
        
    }
}
