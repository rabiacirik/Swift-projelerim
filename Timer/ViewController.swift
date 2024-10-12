//
//  ViewController.swift
//  Timer
//
//  Created by Rabia Cırık on 8.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    var timer = Timer()
    var kalanzaman = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       kalanzaman=15
    TimeLabel.text = "zaman:\(kalanzaman)"
    }

    @IBAction func startClicked(_ sender: Any) {
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
    }
    @objc func timerFunc() {
        TimeLabel.text = "zaman:\(kalanzaman)"
        kalanzaman = kalanzaman-1
        if kalanzaman==0{
            TimeLabel.text="Süre Bitti"
            timer.invalidate()
            kalanzaman=15
        }
        
        
        
    }
    
}

