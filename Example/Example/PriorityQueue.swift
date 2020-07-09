//
//  PriorityQueue.swift
//  Example
//
//  Created by lihao10 on 2020/7/9.
//  Copyright © 2020 GodL. All rights reserved.
//

import Foundation

private protocol Queue {
    associatedtype Element: Comparable
    
    var count:Int {get}
    
    func enqueue(obj:Element)
    
    func dequeue() -> Element?
}


class PriorityQueue<Element: Comparable> {
    lazy private var datas:Array<Element> = []
    
    var count: Int {
        return datas.count
    }
}

extension PriorityQueue: Queue {
    func enqueue(obj: Element) {
        self.datas.append(obj)
        _up()
    }
    
    func dequeue() -> Element? {
        guard count > 0 else {
            return nil
        }
        let result = self.datas[0];
        self.datas.swapAt(0, count-1)
        self.datas.remove(at: count-1)
        _down()
        return result
    }
    
    private func _up() {
        var index = count - 1
        while index > 0 && self.datas[index] > self.datas.father(index: index)! {
            self.datas.swapAt(index, index.father);
            index = index.father
        }
    }
    
    private func _down() {
        var index = 0
        while index.leftChild < count - 1 {
            var childIndex = index.leftChild
            if index.rightChild < count && self.datas.rightChild(index: index)! > self.datas.leftChild(index: index)!  {
                childIndex += 1
            }
            if self.datas[index] >= self.datas[childIndex] {
                break
            }
            self.datas.swapAt(index, childIndex)
            index = childIndex
        }
    }
    
}

fileprivate extension Int {
    
    var leftChild: Int {
        return self * 2 + 1
    }
    
    var rightChild: Int {
        return self * 2 + 2
    }
    
    var father: Int {
        return (self - 1) / 2
    }
}

fileprivate extension Array where Element:Comparable {
    
    func leftChild(index:Int) -> Element? {
        let childIndex = index.leftChild
        return self.count > childIndex ? self[childIndex] : nil
    }
    
    func rightChild(index:Int) -> Element? {
        let childIndex = index.rightChild
        return self.count > childIndex ? self[childIndex] : nil
    }
    
    func father(index:Int) -> Element? {
        let fatherIndex = index.father
        return fatherIndex >= 0 ? self[fatherIndex] : nil
    }
    
}
