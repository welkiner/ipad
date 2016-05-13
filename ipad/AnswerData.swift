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
    func choosedIndexs() -> [NSIndexPath]
}
extension CanGoNext{
    func singleChooes() -> Bool {
        return true
    }
}

struct Answer {
    var one = Question1()
    var two = Question2()
    var three = Question3()
    var four = Question4()
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
    func choosedIndexs() -> [NSIndexPath] {
        var array = [NSIndexPath]()
        A == 0 ? print() : array.append(NSIndexPath.init(forRow: 0, inSection: 0))
        B == 0 ? print() : array.append(NSIndexPath.init(forRow: 1, inSection: 0))
        C == 0 ? print() : array.append(NSIndexPath.init(forRow: 2, inSection: 0))
        D == 0 ? print() : array.append(NSIndexPath.init(forRow: 3, inSection: 0))
        return array
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
    func choosedIndexs() -> [NSIndexPath] {
        var array = [NSIndexPath]()
        A == 0 ? print() : array.append(NSIndexPath.init(forRow: 0, inSection: 1))
        B == 0 ? print() : array.append(NSIndexPath.init(forRow: 1, inSection: 1))
        C == 0 ? print() : array.append(NSIndexPath.init(forRow: 2, inSection: 1))
        D == 0 ? print() : array.append(NSIndexPath.init(forRow: 3, inSection: 1))
        E == 0 ? print() : array.append(NSIndexPath.init(forRow: 4, inSection: 1))
        F == 0 ? print() : array.append(NSIndexPath.init(forRow: 5, inSection: 1))
        return array
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
    func choosedIndexs() -> [NSIndexPath] {
        var array = [NSIndexPath]()
        A == 0 ? print() : array.append(NSIndexPath.init(forRow: 0, inSection: 2))
        B == 0 ? print() : array.append(NSIndexPath.init(forRow: 1, inSection: 2))
        C == 0 ? print() : array.append(NSIndexPath.init(forRow: 2, inSection: 2))
        D == 0 ? print() : array.append(NSIndexPath.init(forRow: 3, inSection: 2))
        E == 0 ? print() : array.append(NSIndexPath.init(forRow: 4, inSection: 2))
        return array
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
    func choosedIndexs() -> [NSIndexPath] {
        var array = [NSIndexPath]()
        A == 0 ? print() : array.append(NSIndexPath.init(forRow: 0, inSection: 3))
        B == 0 ? print() : array.append(NSIndexPath.init(forRow: 1, inSection: 3))
        C == 0 ? print() : array.append(NSIndexPath.init(forRow: 2, inSection: 3))
        D == 0 ? print() : array.append(NSIndexPath.init(forRow: 3, inSection: 3))
        return array
    }
}
