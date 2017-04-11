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
    var one = Question1()
    var two = Question2()
    var three = Question3()
    var four = Question4()
    
    func store() {
        let tempArray = [one.A, one.B, one.C, one.D,
                         two.A, two.B, two.C, two.D, two.E, two.F,
                         three.A, three.B, three.C, three.D, three.E,
                         four.A, four.B, four.C, four.D]
        for index in 0 ... 18 {
            let temp = tempArray[index] + UserDefaults.standard.integer(forKey: String(index))
            UserDefaults.standard.set(temp, forKey: String(index))
        }
        
        let count = UserDefaults.standard.integer(forKey: "count") + 1
        UserDefaults.standard.set(count, forKey: "count")
        
        UserDefaults.standard.synchronize()
    }
}

struct Question1: CanGoNext{
    var A = 0
    var B = 0
    var C = 0
    var D = 0
    func canGoNext() -> Bool {
        return A + B + C + D > 0
    }
    func singleChooes() -> Bool {
        return false
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
        if D == 1 {
            array.append(IndexPath.init(row: 3, section: 0))
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
        case 3:
            changeValue(&D)
        default:
            return
        }
    }
}

struct Question2: CanGoNext {
    var A = 0
    var B = 0
    var C = 0
    var D = 0
    var E = 0
    var F = 0
    func canGoNext() -> Bool {
        return A + B + C + D + E + F > 0
    }
    func choosedIndexs() -> [IndexPath] {
        var array = [IndexPath]()
        if A == 1 {
            array.append(IndexPath.init(row: 0, section: 1))
        }
        if B == 1 {
            array.append(IndexPath.init(row: 1, section: 1))
        }
        if C == 1 {
            array.append(IndexPath.init(row: 2, section: 1))
        }
        if D == 1 {
            array.append(IndexPath.init(row: 3, section: 1))
        }
        if E == 1 {
            array.append(IndexPath.init(row: 4, section: 1))
        }
        if F == 1 {
            array.append(IndexPath.init(row: 5, section: 1))
        }
        return array
    }
     mutating func cleanData() {
        A = 0;B = 0;C = 0;D = 0;E = 0;F = 0
    }
    
    mutating func choose(_ index: NSInteger) {
        switch index {
        case 0:
            changeValue(&A)
        case 1:
            changeValue(&B)
        case 2:
            changeValue(&C)
        case 3:
            changeValue(&D)
        case 4:
            changeValue(&E)
        case 5:
            changeValue(&F)
        default:
            return
        }
    }
}

struct Question3: CanGoNext {
    var A = 0
    var B = 0
    var C = 0
    var D = 0
    var E = 0
    func canGoNext() -> Bool {
        return A + B + C + D + E > 0
    }
    func choosedIndexs() -> [IndexPath] {
        var array = [IndexPath]()
        if A == 1 {
            array.append(IndexPath.init(row: 0, section: 2))
        }
        if B == 1 {
            array.append(IndexPath.init(row: 1, section: 2))
        }
        if C == 1 {
            array.append(IndexPath.init(row: 2, section: 2))
        }
        if D == 1 {
            array.append(IndexPath.init(row: 3, section: 2))
        }
        if E == 1 {
            array.append(IndexPath.init(row: 4, section: 2))
        }
        return array
    }
     mutating func cleanData() {
        A = 0;B = 0;C = 0;D = 0;E = 0
    }
    
    mutating func choose(_ index: NSInteger) {
        switch index {
        case 0:
            changeValue(&A)
        case 1:
            changeValue(&B)
        case 2:
            changeValue(&C)
        case 3:
            changeValue(&D)
        case 4:
            changeValue(&E)
        default:
            return
        }
    }
}

struct Question4: CanGoNext {
    var A = 0
    var B = 0
    var C = 0
    var D = 0
    func canGoNext() -> Bool {
        return A + B + C + D > 0
    }
    func choosedIndexs() -> [IndexPath] {
        var array = [IndexPath]()
        if A == 1 {
            array.append(IndexPath.init(row: 0, section: 3))
        }
        if B == 1 {
            array.append(IndexPath.init(row: 1, section: 3))
        }
        if C == 1 {
            array.append(IndexPath.init(row: 2, section: 3))
        }
        if D == 1 {
            array.append(IndexPath.init(row: 3, section: 3))
        }
        return array
    }
    mutating func cleanData() {
        A = 0;B = 0;C = 0;D = 0
    }
    
    mutating func choose(_ index: NSInteger) {
        switch index {
        case 0:
            changeValue(&A)
        case 1:
            changeValue(&B)
        case 2:
            changeValue(&C)
        case 3:
            changeValue(&D)
        default:
            return
        }
    }
}
