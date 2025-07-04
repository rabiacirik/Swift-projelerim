//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Rabia Cırık on 13.06.2025.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hiddleTimer = Timer()
    var highScore = 0
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score : \(score)"
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil{
            highScore = 0
            highScoreLabel.text = "High Score : \(highScore)"
        }
        
        if let storedHighScore = storedHighScore as? Int{
            highScore = storedHighScore
            highScoreLabel.text = "High Score : \(highScore)"   
        }
        
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8]
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        
        counter = 15
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hiddleTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(hiddenKenny), userInfo: nil, repeats: true)
    
hiddenKenny()
    }
@objc func hiddenKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
    }
    let random = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
    kennyArray[random].isHidden = false
    }

@objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score:\(score)"
    }
@objc func countDown() {
        counter-=1
    timeLabel.text = String(counter)
    if counter == 0 {
        timer.invalidate()
        hiddleTimer.invalidate()
        for kenny in kennyArray {
            kenny.isHidden = true
    }
        if score > highScore {
            highScore = score
            highScoreLabel.text = "High Score:\(highScore)"
            UserDefaults.standard.set(highScore, forKey: "highScore")
        }
        
        
        let alert = UIAlertController(title: "Game Over", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
        let OkButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        let replayButton = UIAlertAction(title: "replay", style: UIAlertAction.Style.default) { UIAlertAction in
            self.score = 0
            self.scoreLabel.text = "Score:\(self.score)"
            self.counter = 30
            self.timeLabel.text = String(self.counter)
            self.hiddleTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hiddenKenny), userInfo: nil, repeats: true)
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            
        }
            
        alert.addAction(OkButton)
        alert.addAction(replayButton)
        self.present(alert, animated: true, completion: nil)
    }
    }
}

