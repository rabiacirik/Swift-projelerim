//
//  ViewController.swift
//  jestAlgilayicilar
//
//  Created by Rabia Cırık on 5.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var label: UILabel!
    var izmir=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageview.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(gorselDegistir))
        imageview.addGestureRecognizer(gestureRecognizer)
    }

    @objc func gorselDegistir(){
        if izmir==false{
            imageview.image = UIImage(named: "izmir")
            label.text="İzmir"
            izmir=true
        }
        else{
            imageview.image = UIImage(named: "istanbul")
            label.text="İstanbul"
            izmir=false
        }
        
    }
}

