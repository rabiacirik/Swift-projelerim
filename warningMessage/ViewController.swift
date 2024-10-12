//
//  ViewController.swift
//  warningMessage
//
//  Created by Rabia Cırık on 5.05.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        
        if mailTextField.text == "" {
            //mail girilmemişse
            alertoluştur(titlegirdisi: "Hata!", messagegirdisi: "Email eksik")
        }
       else if passwordTextField.text == "" {
            //parola girilmemişse
           alertoluştur(titlegirdisi: "Hata!", messagegirdisi: "parola eksik")
        }
       else if passwordTextField.text != password2TextField.text{
            //iki parola uyuşmuyorsa
           alertoluştur(titlegirdisi: "Hata!", messagegirdisi: "parolalar uyuşmuyor")
        }
        else{
            alertoluştur(titlegirdisi: "Tebrikler!", messagegirdisi: "kullanıcı kaydı oluşturuldu")
        }
        
       
    }
    
    func alertoluştur (titlegirdisi: String,messagegirdisi: String){
        let warningMessage = UIAlertController(title:titlegirdisi, message:messagegirdisi, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            // ok button tıklanınca olacakalar
            print("ok button tıklandı")
        }
        
        warningMessage.addAction(okButton)
        self.present(warningMessage, animated: true,completion: nil)
    }
    
}

