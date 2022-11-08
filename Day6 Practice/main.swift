//
//  main.swift
//  validateID
//
//  Created by SONG on 2022/11/08.
//

import Foundation
func validateID(name: String) -> Bool {
    var array : [Character] = []
    if !((name.count >= 5) && (name.count <= 23 )) {
        return false
    }
    for ch in name {
        if (ch.isLowercase != true) && (ch.isUppercase != true) && (ch.isNumber != true) && (ch != "-") {
            return false
        }
        array.append(ch)
    }
    for index in 0...array.count-3 {
        if array[index].isNumber == true && array[index+1].isNumber == true && array[index+2].isNumber == true {
            return false
        }
        if array[index].isNumber == true && array[index] == array[index+1] && array[index] == array[index+2] {
            return false
        }
    }
    
    return true
}

func validatePassword( password : String ) -> Int {
    struct count {
        var countNumber = 0
        var countEng = 0
        var countSymbol = 0
    }
    var level = 0
    var checkingLevel = count()
    
    for ch in password {
        if ch.isNumber == true {
            checkingLevel.countNumber += 1
        }
        else if (ch.isLetter) == true {
            checkingLevel.countEng += 1
        }
        else if ch.isNumber == false && ch.isLetter == false {
            checkingLevel.countSymbol += 1
        }
    }
    
    if password.count < 8 {
        if checkingLevel.countNumber + checkingLevel.countSymbol + checkingLevel.countEng == checkingLevel.countNumber {
            level = 1
        }
        else if checkingLevel.countNumber + checkingLevel.countSymbol + checkingLevel.countEng == checkingLevel.countEng {
            level = 2
        }
        else {
            level = 3
        }
    }
    else if password.count >= 8 {
        if checkingLevel.countEng >= 1 && checkingLevel.countNumber >= 1 {
            level = 4
            if checkingLevel.countSymbol >= 1 {
                level = 5
            }
        }
        else {
            level = 3
        }
    }
    return level
}


func validateSocial(number: String) -> Bool {
    var arrayInt : [[Int]] = [[],[2,3,4,5,6,7,8,9,2,3,4,5,1]]
    var sum = 0
    for ch in number {
        arrayInt[0].append(Int(String(ch))!)
    }
    for i in 0...12 {
        sum += arrayInt[0][i] * arrayInt[1][i]
    }
    if (11 - (sum % 11) )/10 == arrayInt[0].last {
        return true
    }
    else {
        return false
    }
}

func antFuction( input : Array<Int> )-> Array<Int> {
    var previousValue = 1
    var count = 0
    var result : [Int] = []
    
    for item in input {
        if item == previousValue {
            count += 1
        }
        else if item != previousValue {
            result.append(previousValue)
            result.append(count)
            previousValue = item
            count = 1
        }
    }
    result.append(previousValue)
    result.append(count)
    return result
}

func duplicateWords(inputWords:Array<String>)-> Array<String> {
    var cntDict : [String:Int] = Dictionary()
    var resultArray : [String] = []
    for str in inputWords {
        if cntDict[str] == 0 {
            cntDict.updateValue(1, forKey: str)
        }
        else if cntDict[str] != 1 {
            cntDict[str] = 0
        }
        
    }
    
    for (key,value) in cntDict{
        if value == 1 {
            resultArray.append(key)
        }
    }
    return resultArray
}

let inputData = readLine()!


//validateID(name: inputData)
//validatePassword(password: inputData)
//validateSocial(number: inputData)

//*************************//
//var intArray : [Int] = []
//for ch in inputData {
//    intArray.append(Int(String(ch))!)
//}
//antFuction(input:intArray)

//**************************//
var strArray : [String] = inputData.components(separatedBy: " ") //*
duplicateWords(inputWords: strArray)


