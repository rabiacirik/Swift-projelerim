//
//  ViewController.swift
//  Calculator
//
//  Created by Rabia Cırık on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var IlkText: UITextField!
    @IBOutlet weak var IkinciText: UITextField!
    @IBOutlet weak var sonuc: UILabel!
    var islem : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toplamaTiklandi(_ sender: Any) {
        if let ilkSayi=Double(IlkText.text!){
            if let ikinciSayi=Double(IkinciText.text!){
                islem = ilkSayi + ikinciSayi
                sonuc.text = String(islem)
            }
        }
    }
    
    
    @IBAction func cikarmaTiklandi(_ sender: Any) {
        if let ilkSayi=Double(IlkText.text!){
            if let ikinciSayi=Double(IkinciText.text!){
                islem = ilkSayi - ikinciSayi
                sonuc.text = String(islem)
            }
        }
    }
    
    
    @IBAction func carpmaTiklandi(_ sender: Any) {
        if let ilkSayi=Double(IlkText.text!){
            if let ikinciSayi=Double(IkinciText.text!){
                islem = ilkSayi * ikinciSayi
                sonuc.text = String(islem)
            }
        }
    }
    

    @IBAction func bolmeTiklandi(_ sender: Any) {
        if let ilkSayi=Double(IlkText.text!){
            if let ikinciSayi=Double(IkinciText.text!){
                islem = ilkSayi / ikinciSayi
                sonuc.text = String(islem)
            }
        }
    }
}

