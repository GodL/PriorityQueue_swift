//
//  main.swift
//  Example
//
//  Created by lihao10 on 2020/7/9.
//  Copyright © 2020 GodL. All rights reserved.
//

import Foundation

var queue = PriorityQueue<Int>()

for i in 0...100 {
    queue.enqueue(obj: i)
}

while let obj = queue.dequeue()  {
    print(obj)
}



print("Hello, World!")

