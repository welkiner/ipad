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
        super.awakeFromNib()
        self.setBackgroundImage(imageColor(UIColor.black.withAlphaComponent(0.7)), for: .highlighted)
        self.setBackgroundImage(imageColor(UIColor.black.withAlphaComponent(0.3)), for: .disabled)
    }
}
@IBDesignable
class PageBtn: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

func imageColor(_ color: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
