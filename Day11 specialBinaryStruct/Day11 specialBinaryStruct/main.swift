//
//  main.swift
//  Day11 specialBinaryStruct
//
//  Created by SONG on 2022/11/15.
//

import Foundation

struct SpecialBinary {
    private var values : [String] = []
    
    var count : Int {
        get {
            values.count
        }
    }
    
    init(with total : Int) {
        for num in 0 ..< Int(powf(2.0,Float(total))) {
            values.append(String(format: "%0\(total)d", Int(String(num, radix: 2))!))
        }
    }
    
    func find(by bitcount : Int) -> Array<String> {
        var cnt : Int
        var result : [String] = []
        for item in values {
            cnt = 0
            for char in item.map({String($0)}) {
                if char == "1" {
                    cnt += 1
                }
            }
            if cnt == bitcount{
                result.append(item)
            }
        }
        printFunction(array: result)
        return result
    }
    
    func printFunction (array : [String]) {
        print("[")
        for num in 0 ..< array.count{
            print("\t",terminator: "")
            if num < array.count {
                print("\"\(array[num])\",")
            }
            else {
                print("\(array[num])")
            }
        }
        print("]")
    }
    
    
    
}

let test = SpecialBinary(with: 5)
test.find(by: 3)


