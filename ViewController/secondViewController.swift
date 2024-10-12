//
//  secondViewController.swift
//  ViewController
//
//  Created by Rabia Cırık on 1.05.2024.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var FoundPassword: UILabel!
    
    var enterPassword = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        FoundPassword.text=enterPassword
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
