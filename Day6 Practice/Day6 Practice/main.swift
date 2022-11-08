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

let input = readLine()!

//validateID(name: input)
validatePassword(password: input)



