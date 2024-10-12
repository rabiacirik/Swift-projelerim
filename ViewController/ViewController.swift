//
//  ViewController.swift
//  ViewController
//
//  Created by Rabia Cırık on 1.05.2024.
//

import UIKit

class ViewController: UIViewController {
    var password=""

    @IBOutlet weak var FirstLabel: UILabel!
    
    @IBOutlet weak var TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view Did Appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view Did Disappear")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view Will Appear")
        TextField.text=""
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("vie wWill Disappear")
    }


    @IBAction func CheckIt(_ sender: Any) {
        password=TextField.text!
        if password == "Rabia"{
            performSegue(withIdentifier : "toSecondVC", sender: nil)
        }else{
            FirstLabel.text = "Wrong Password"
        }
        }
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toSecondVC" {
            let destinationVC=segue.destination as! secondViewController
            destinationVC.enterPassword=password
        }
        
    }
}

