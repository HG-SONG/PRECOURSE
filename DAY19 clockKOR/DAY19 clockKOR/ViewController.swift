//
//  ViewController.swift
//  DAY19 clockKOR
//
//  Created by SONG on 2022/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var 오: UILabel!
    @IBOutlet weak var 전: UILabel!
    @IBOutlet weak var 후: UILabel!
    @IBOutlet weak var 영: UILabel!
    @IBOutlet weak var 열: UILabel!
    @IBOutlet weak var 한: UILabel!
    @IBOutlet weak var 두: UILabel!
    @IBOutlet weak var 세: UILabel!
    @IBOutlet weak var 네: UILabel!
    @IBOutlet weak var 다: UILabel!
    @IBOutlet weak var 여6: UILabel!
    @IBOutlet weak var 섯: UILabel!
    @IBOutlet weak var 일7: UILabel!
    @IBOutlet weak var 곱: UILabel!
    @IBOutlet weak var 여8: UILabel!
    @IBOutlet weak var 덟: UILabel!
    @IBOutlet weak var 아: UILabel!
    @IBOutlet weak var 홉: UILabel!
    @IBOutlet weak var 시: UILabel!
    
    @IBOutlet weak var pictureSunMoon: UILabel!
    
    @IBOutlet weak var 이십분: UILabel!
    @IBOutlet weak var 삼십분: UILabel!
    @IBOutlet weak var 사십분: UILabel!
    @IBOutlet weak var 오십분: UILabel!
    @IBOutlet weak var 십분: UILabel!

    @IBOutlet weak var 일분: UILabel!
    @IBOutlet weak var 이분: UILabel!
    @IBOutlet weak var 삼분: UILabel!
    @IBOutlet weak var 사분: UILabel!
    @IBOutlet weak var 오분: UILabel!
    @IBOutlet weak var 육분: UILabel!
    @IBOutlet weak var 칠분: UILabel!
    @IBOutlet weak var 팔분: UILabel!
    @IBOutlet weak var 구분: UILabel!
    @IBOutlet weak var 분: UILabel!
    
    @IBOutlet weak var 초: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        초.textColor = .white
        run()
        
    }
    
    func run()  {
        lightOff()
        lightOn()
        changePicture()
        loop()
    }
    
    func loop() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { self.run()
        }
    }
    
    func currentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let time = formatter.string(from: Date())
        return time
    }
    
    func divideTime (time : String) -> [String] {
        let dividedData : [String] = time.components(separatedBy: ":")
        return dividedData
    }
    
    func isAM (hour : String) -> Bool {
        if Int(hour)! < 12 {
            return true
        }
        return false
    }
    
    func checkingHour (hour : String) -> [String]{
        var hourLettersArray : [String] = []
        var newHour : Int = Int(hour)!
        if Int(hour)! > 12 {
            newHour -= 12
        }
        if newHour >= 10 {
            hourLettersArray.append("열")
        }
        
        switch newHour % 10 {
        case 1 :
            hourLettersArray.append("한")
        case 2 :
            hourLettersArray.append("두")
        case 3 :
            hourLettersArray.append("세")
        case 4 :
            hourLettersArray.append("네")
        case 5 :
            hourLettersArray.append("다")
            hourLettersArray.append("섯")
        case 6 :
            hourLettersArray.append("여6")
            hourLettersArray.append("섯")
        case 7 :
            hourLettersArray.append("일7")
            hourLettersArray.append("곱")
        case 8 :
            hourLettersArray.append("여8")
            hourLettersArray.append("덟")
        case 9 :
            hourLettersArray.append("아")
            hourLettersArray.append("홉")
        
        default:
            break
        }
        hourLettersArray.append("시")
        return hourLettersArray
    }
    
    func checkingMin(min : String) -> [String] {
        var minLettersArray : [String] = []
        
        if Int(min)! / 10 >= 1 {
            switch Int(min)! / 10 {
            case 5 :
                minLettersArray.append("오십분")
            case 4 :
                minLettersArray.append("사십분")
            case 3 :
                minLettersArray.append("삼십분")
            case 2 :
                minLettersArray.append("이십분")
            default:
                break
            }
            minLettersArray.append("십분")
        }
        
        switch Int(min)! % 10 {
        case 9 :
            minLettersArray.append("구분")
        case 8 :
            minLettersArray.append("팔분")
        case 7 :
            minLettersArray.append("칠분")
        case 6 :
            minLettersArray.append("육분")
        case 5 :
            minLettersArray.append("오분")
        case 4 :
            minLettersArray.append("사분")
        case 3 :
            minLettersArray.append("삼분")
        case 2 :
            minLettersArray.append("이분")
        case 1 :
            minLettersArray.append("일분")
            
        default:
            break
        }
        minLettersArray.append("분")
        return minLettersArray
    }

    func checkingSec (sec : String ) -> String {
        var secLettersStr = ""
        
        if Int(sec)! / 10 >= 1 {
            switch Int(sec)! / 10{
            case 5 :
                secLettersStr += "오십"
            case 4 :
                secLettersStr += "사십"
            case 3 :
                secLettersStr += "삼십"
            case 2 :
                secLettersStr += "이십"
            case 1 :
                secLettersStr += "십"
            default:
                break
            }
        }
        switch Int(sec)! % 10{
        case 9 :
            secLettersStr += "구"
        case 8 :
            secLettersStr += "팔"
        case 7 :
            secLettersStr += "칠"
        case 6 :
            secLettersStr += "육"
        case 5 :
            secLettersStr += "오"
        case 4 :
            secLettersStr += "사"
        case 3 :
            secLettersStr += "삼"
        case 2 :
            secLettersStr += "이"
        case 1 :
            secLettersStr += "일"
        case 0 :
            if Int(sec)! / 10 < 1{
                secLettersStr += "영"
            }
            
        default:
            break
        }
        secLettersStr += "초"
        return secLettersStr
    }
    
    func lightOff() {
        전.textColor = .darkGray
        후.textColor = .darkGray
        영.textColor = .darkGray
        열.textColor = .darkGray
        한.textColor = .darkGray
        두.textColor = .darkGray
        세.textColor = .darkGray
        네.textColor = .darkGray
        다.textColor = .darkGray
        여6.textColor = .darkGray
        섯.textColor = .darkGray
        일7.textColor = .darkGray
        곱.textColor = .darkGray
        여8.textColor = .darkGray
        덟.textColor = .darkGray
        아.textColor = .darkGray
        홉.textColor = .darkGray
        
        이십분.textColor = .darkGray
        삼십분.textColor = .darkGray
        사십분.textColor = .darkGray
        오십분.textColor = .darkGray
        십분.textColor = .darkGray
        일분.textColor = .darkGray
        이분.textColor = .darkGray
        삼분.textColor = .darkGray
        사분.textColor = .darkGray
        오분.textColor = .darkGray
        육분.textColor = .darkGray
        칠분.textColor = .darkGray
        팔분.textColor = .darkGray
        구분.textColor = .darkGray
    }
    
    func lightOn() {
        let timeData = divideTime(time: currentTime())
        오.textColor = .white
        
        if isAM(hour: timeData[0]) == true {
            전.textColor = .white
        }
        else {
            후.textColor = .white
        }
        
        for item in checkingHour(hour: timeData[0]) {
            switch item {
            case "열" :
                열.textColor = .white
            case "한" :
                한.textColor = .white
            case "두" :
                두.textColor = .white
            case "세" :
                세.textColor = .white
            case "네" :
                네.textColor = .white
            case "다" :
                다.textColor = .white
            case "여6" :
                여6.textColor = .white
            case "섯" :
                섯.textColor = .white
            case "일7" :
                일7.textColor = .white
            case "곱" :
                곱.textColor = .white
            case "여8" :
                여8.textColor = .white
            case "덟" :
                덟.textColor = .white
            case "아" :
                아.textColor = .white
            case "홉" :
                홉.textColor = .white
            case "시" :
                시.textColor = .white
                
            default:
                break
            }
        }
        
        for item in checkingMin(min: timeData[1]) {
            switch item {
            case "이십분" :
                이십분.textColor = .white
            case "삼십분" :
                삼십분.textColor = .white
            case "사십분" :
                사십분.textColor = .white
            case "오십분" :
                오십분.textColor = .white
            case "십분" :
                십분.textColor = .white
            case "일분" :
                일분.textColor = .white
            case "이분" :
                이분.textColor = .white
            case "삼분" :
                삼분.textColor = .white
            case "사분" :
                사분.textColor = .white
            case "오분" :
                오분.textColor = .white
            case "육분" :
                육분.textColor = .white
            case "칠분" :
                칠분.textColor = .white
            case "팔분" :
                팔분.textColor = .white
            case "구분" :
                구분.textColor = .white
            case "분" :
                분.textColor = .white
            default:
                break
            }
        }
        초.text = checkingSec(sec: timeData[2])
    }
    
    func isMoon (hour : String) ->Bool {
        if (Int(hour)! >= 0 && Int(hour)! < 7) || Int(hour)! >= 19 {
            return true
        }
            return false
    }
    
    func changePicture() {
        let timeData = divideTime(time: currentTime())
        
        if isMoon(hour:timeData[0]) == true {
            pictureSunMoon.text = "🌛"
        }
        else {
            pictureSunMoon.text = "🌞"
        }
    }
}

