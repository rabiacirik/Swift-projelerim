//
//  ViewController.swift
//  ButtonClick
//
//  Created by Rabia Cırık on 2.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func MyButton(_ sender: Any) {
        MyLabel.text = "Rabia Cırık"
    }
    
}

