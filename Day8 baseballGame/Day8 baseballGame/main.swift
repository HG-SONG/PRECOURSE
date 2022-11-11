import Foundation

struct BaseballGame {
    var swingCount = 0
    var pitch : [Int] = []
    var strikeCheck = 0
    mutating func newGame() {
        var selectNumber : [Int] = [0,1,2,3,4,5,6,7,8,9]
        var newGameArray : [Int] = []
        var number : Int
        for _ in 0...2 {
            number = Int.random(in: 0 ... selectNumber.count-1)
            newGameArray.append(selectNumber[number])
            selectNumber.remove(at: number)
        }
        pitch = newGameArray
//        print(pitch)
    }
    
    mutating func hit(num : Int) -> (strikeCount:Int, ballCount:Int){
        swingCount += 1
        var numString : String = ""
        if num / 100 < 1 {
            numString += "0"
        }
        numString += String(num)
        var hitArray :[Int] = []
        for char in numString {
            hitArray.append(Int(String(char))!)
        }
        var strike : Int = 0
        var ball : Int = 0
        
        for i in (0 ... 2) {
            for j in 0 ... 2 {
                if i == j {
                    if pitch[i] == hitArray[j] {
                        strike += 1
                    }
                }
                else {
                    if pitch[i] == hitArray[j] {
                        ball += 1
                    }
                }
            }
        }
        
        print("strike : \(strike) , ball : \(ball)")
        print(swingCount)
        strikeCheck = strike
        return (strike,ball)
    }
    
    func showGameScore() -> Bool {
        if strikeCheck == 3 {
            return true
        }
        else {
            return false
        }
    }
}
    

var baseball = BaseballGame()
baseball.newGame()
for _ in 0...8 {
    baseball.hit(num: Int(String(readLine()!))!)
    if baseball.showGameScore() == true {
        break
    }
}






