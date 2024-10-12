//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by Rabia Cırık on 4.05.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NoteTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let recordedNote = UserDefaults.standard.object(forKey: "note")
        let recordedTime = UserDefaults.standard.object(forKey: "time")
        
        if let LastNote = recordedNote as? String{
            noteLabel.text = "yapılacak iş: \(LastNote)"
        }
        if let LastTime = recordedTime as? String{
            timeLabel.text = "yapılacak zaman: \(LastTime)"
        }
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(NoteTextField.text!, forKey: "note")
        UserDefaults.standard.set(timeTextField.text!, forKey: "time")
        noteLabel.text = "yapılacak iş: \(NoteTextField.text!)"
        timeLabel.text = "yapılacak zaman: \(timeTextField.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        let recordedNote = UserDefaults.standard.object(forKey: "note")
        let recordedTime = UserDefaults.standard.object(forKey: "time")
        
        if (recordedNote as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "note")
            noteLabel.text="yapılacak iş: "
        }
        if (recordedTime as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "time")
            timeLabel.text="yapılacak zaman: "
        }
        
    }
}

