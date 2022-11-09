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

func solution2(_ numbers:[Int]) -> [Int] {
    var sum = 0
    var resultArray : [Int] = []
    for i in 0 ..< numbers.count-1 {
        for j in i+1 ..< numbers.count {
            sum = numbers[i] + numbers[j]
            resultArray.append(sum)
        }
    }
    return Set(resultArray).sorted(by:<)
}

