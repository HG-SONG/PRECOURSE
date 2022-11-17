
import UIKit

class ViewController: UIViewController {
    var numberOfWaiting : Int = 0
    
    @IBOutlet weak var waitingPeople: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var btnWaitingUI: UIButton!
    
    @IBOutlet weak var btnDoneUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBtnState()
        changeProgressBar()
    }
    
    @IBAction func btnWaiting(_ sender: UIButton) {
        addWaitingPeople()
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        subWaitingPeople()
    }
    
    func addWaitingPeople() {
        if numberOfWaiting < 20 {
            numberOfWaiting += 1
            waitingPeople.text = String(format: "%02d", numberOfWaiting) + " 명"
        }
        changeTextColor()
        changeBtnState()
        changeProgressBar()
    }
    
    func subWaitingPeople() {
        if numberOfWaiting > 0 {
            numberOfWaiting -= 1
            waitingPeople.text = String(format: "%02d", numberOfWaiting) + " 명"
        }
        changeTextColor()
        changeBtnState()
        changeProgressBar()
    }
    
    func changeTextColor() {
        if numberOfWaiting >= 20 {
            waitingPeople.textColor = .red
        }
        else {
            waitingPeople.textColor = .black
        }
    }
    
    func changeBtnState() {
        if numberOfWaiting == 0 {
            btnDoneUI.isEnabled = false
        }
        else {
            btnDoneUI.isEnabled = true
        }
        
        if numberOfWaiting == 20 {
            btnWaitingUI.isEnabled = false
        }
        else {
            btnWaitingUI.isEnabled = true
        }
    }
    
    func changeProgressBar() {
        progressBar.progress = Float(numberOfWaiting)  / Float(20)
    }
}

