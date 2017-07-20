//
//  AnswerData.swift
//  ipad
//
//  Created by tl on 16/5/13.
//  Copyright © 2016年 welkiner. All rights reserved.
//
import UIKit

protocol CanGoNext {
    func canGoNext() -> Bool
    func singleChooes() -> Bool
    func choosedIndexs() -> [IndexPath]
    mutating func choose(_ index: NSInteger)
}
extension CanGoNext{
    func singleChooes() -> Bool {
        return true
    }
    mutating func cleanData(){
        
    }
    fileprivate mutating func changeValue(_ value: inout Int) -> Void{
        value = (value + 1) % 2
    }
}

struct Answer {
    var one = Question()
    var two = Question()
    var three = Question()
    var four = Question()
    var five = Question()
    
    
    func store() {
        let tempArray = [one.A, one.B, one.C,
                         two.A, two.B, two.C,
                         three.A, three.B, three.C,
                         four.A, four.B, four.C,
                         five.A, five.B, five.C]
        for index in 0 ... 15 {
            let temp = tempArray[index] + UserDefaults.standard.integer(forKey: String(index))
            UserDefaults.standard.set(temp, forKey: String(index))
        }
        
        let count = UserDefaults.standard.integer(forKey: "count") + 1
        UserDefaults.standard.set(count, forKey: "count")
        
        UserDefaults.standard.synchronize()
    }
}

struct Question: CanGoNext{
    var A = 0
    var B = 0
    var C = 0
    func canGoNext() -> Bool {
        return A + B + C  > 0
    }
    mutating func cleanData() {
        A = 0;B = 0;C = 0;
    }
    func choosedIndexs() -> [IndexPath] {
        var array = [IndexPath]()
        if A == 1 {
            array.append(IndexPath.init(row: 0, section: 0))
        }
        if B == 1 {
            array.append(IndexPath.init(row: 1, section: 0))
        }
        if C == 1 {
            array.append(IndexPath.init(row: 2, section: 0))
        }
        return array
    }
    mutating func choose(_ index: NSInteger) {
        switch index {
        case 0:
            changeValue(&A)
        case 1:
            changeValue(&B)
        case 2:
            changeValue(&C)
        default:
            return
        }
    }
}
