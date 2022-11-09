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


func solution3(_ answers:[Int]) -> [Int] {
    let one : [Int] = [1,2,3,4,5] //0~4
    let two : [Int] = [2,1,2,3,2,4,2,5] //0~7
    let three : [Int] = [3,3,1,1,2,2,4,4,5,5] //0~9
    var pointOne = 0
    var pointTwo = 0
    var pointThree = 0
    var resultArray : [Int] = []
    
    for i in 0 ..< answers.count {
        if answers[i] == one[i%5] {
            pointOne += 1
        }
        if answers[i] == two[i%8] {
            pointTwo += 1
        }
        if answers[i] == three[i%10] {
            pointThree += 1
        }
    }
    resultArray.append(max(pointOne,pointTwo,pointThree))
    if resultArray[0] == pointOne {
        resultArray.append(1)
    }
    if resultArray[0] == pointTwo {
        resultArray.append(2)
    }
    if resultArray[0] == pointThree {
        resultArray.append(3)
    }
    
    resultArray.remove(at:0)
    return resultArray
}

func solution4(_ a:Int, _ b:Int) -> String {
    let dayArray : [String] = ["MON","TUE","WED","THU","FRI","SAT","SUN"]
    let doomsDay : [Int] = [4,8,7,4,9,6,11,8,5,10,7,12] // => 월요일
    var selectIndex : Int = 0
    if (doomsDay[a-1] - b) % 7 > 0 {
        selectIndex = 7 - ((doomsDay[a-1] - b) % 7)
    }
    else if (doomsDay[a-1] - b) % 7 < 0 {
        selectIndex = abs((doomsDay[a-1] - b) % 7)
    }
    return dayArray[ selectIndex ]
}

func solution4(_ n:Int) -> Int {
    var sum : Int = 0
    if n != 0 {
        for div in 1...n {
            if n % div == 0 {
                sum += div
            }
        }
    }
    else {
        return 0
    }
    return sum
}
