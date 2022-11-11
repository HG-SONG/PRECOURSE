//
//  ViewController.swift
//  Day9 passwordChecking
//
//  Created by SONG on 2022/11/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var decriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func editedSomething(_ sender: UITextField) {
        change()
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        change()
    }
    func change() {
        switch passwordValidator(password:passwordInput.text!) {
        case 1 :
            levelView.backgroundColor = .red
            decriptionLabel.text = "아주 약함"
        case 2 :
            levelView.backgroundColor = .orange
            decriptionLabel.text = "약함"
        case 3 :
            levelView.backgroundColor = .yellow
            decriptionLabel.text = "보통"
        case 4 :
            levelView.backgroundColor = .blue
            decriptionLabel.text = "강함"
        case 5 :
            levelView.backgroundColor = .green
            decriptionLabel.text = "아주 강함"
        default:
            break
        }
        
    }
    func passwordValidator( password : String ) -> Int {
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
}

