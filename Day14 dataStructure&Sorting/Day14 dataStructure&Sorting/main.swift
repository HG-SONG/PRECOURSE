//
//  main.swift
//  Day14 dataStructure&Sorting
//
//  Created by SONG on 2022/11/17.
//

import Foundation

struct List {
    func enumerateList(_ A : [Int]){
        var nextIndex = 0
        
        while(A[nextIndex] != -1) {
            print(A[nextIndex])
            nextIndex = A[nextIndex]
        }
        print(-1)
    }
    
    func countOfList(_ A : [Int])->Int {
        var nextIndex = 0
        var countList = 1
        while(A[nextIndex] != -1) {
            countList += 1
            nextIndex = A[nextIndex]
        }
        return countList
    }
    
    func isFullList(_ A : [Int])-> Bool {
        var boolReturn : Bool
        if countOfList(A) == A.count {
            boolReturn = true
        }
        else {
            boolReturn = false
        }
        return boolReturn
    }
    
    func printResult(_ arg : Any) {
        print(arg)
    }
}
let testArray : [Int] = [1,4,-1,3,2]
let testObj = List()
testObj.enumerateList(testArray)
testObj.printResult(testObj.countOfList(testArray))
testObj.printResult(testObj.isFullList(testArray))


