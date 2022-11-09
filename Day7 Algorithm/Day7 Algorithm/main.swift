//
//  main.swift
//  Day7 Algorithm
//
//  Created by SONG on 2022/11/09.
//

import Foundation

func solution1(_ arr:[Int], _ divisor:Int) -> [Int] {
    var resultArray : [Int] = []
    for index in 0 ..< arr.count {
        if (arr[index] % divisor == 0) {
            resultArray.append(arr[index])
        }
    }
    if resultArray.count != 0 {
        resultArray = resultArray.sorted(by:<)
    }
    else if resultArray.count == 0 {
        resultArray.append(-1)
    }
    return resultArray
}


