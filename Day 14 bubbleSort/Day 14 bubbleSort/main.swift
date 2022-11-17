//
//  bubblesort.swift
//  Day14 dataStructure&Sorting
//
//  Created by SONG on 2022/11/17.
//

import Foundation

class BubbleSort {
    var unsortedArray : [Int] = []
    var sortedArray : [Int]
    init(arr:[Int]){
        for item in arr {
            unsortedArray.append(item)
        }
        sortedArray = unsortedArray
    }
    
    func sorted(isAscending : Bool) -> Array<Int>{
        var swapped : Bool
        var swapCounter = 0
        
        func swap(aIndex : Int , bIndex : Int) {
            let tmp = sortedArray[aIndex]
            sortedArray[aIndex] = sortedArray[bIndex]
            sortedArray[bIndex] = tmp
        }
        repeat{
            swapped = false
            for i in 0 ..< sortedArray.count - 1 {
                for j in i ..< sortedArray.count {
                    
                    if isAscending == true ? sortedArray[i] > sortedArray[j] : sortedArray[i] < sortedArray[j] {
                        swap(aIndex: i, bIndex: j)
                        swapped = true
                        swapCounter += 1
                    }
                }
            }
        }while swapped
        return sortedArray
    }
}
let testArray : [Int] = [1,4,-1,3,2]
var testobj = BubbleSort(arr: testArray)
print(testobj.sorted(isAscending: false))

