//
//  ViewController.swift
//  LayoutProject
//
//  Created by Rabia Cırık on 14.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //label
        let widht = view.frame.size.width
        let height = view.frame.size.height
    
        let myLabel = UILabel()
        myLabel.text="test label"
        myLabel.textAlignment = .center
        myLabel.frame=CGRect(x: widht * 0.5 - 50, y: height * 0.5 - 50, width: 100, height: 100)
        view.addSubview(myLabel)
        
        //button
        let myButton = UIButton()
        myButton.setTitle("MyButton", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: widht*0.5-100, y: height*0.60, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.MyFunc), for: UIControl.Event.touchUpInside)
        
        
        
    }
    
    @IBAction func MyFunc() {
        print("User clicked the button ")
    }


}

