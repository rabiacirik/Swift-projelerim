//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Rabia Cırık on 26.06.2025.
//

import UIKit
import CoreData

class DetailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    
    var choosenPainting = ""
    var chosenPaintingID : UUID?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if choosenPainting != ""{
            
            SaveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Paintings")
            let idString = chosenPaintingID?.uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id == %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0{
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String{
                            nameTextField.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String{
                            artistTextField.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int{
                            yearTextField.text = String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
            }
            catch{
                print("error")
            }
            
        }
        else{
            SaveButton.isHidden = false
            SaveButton.isEnabled = false
            nameTextField.text=""
            artistTextField.text=""
            yearTextField.text=""
            
        }
        
        //Recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        imageView.isUserInteractionEnabled = true
        let imageTapReognizer = UITapGestureRecognizer(target: self, action: #selector(SelectImage))
        imageView.addGestureRecognizer(imageTapReognizer)
        
        
    }
    
    @objc func SelectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true // edite izin verir
        present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        SaveButton.isEnabled=true
        self.dismiss(animated: true, completion: nil)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    

   
    @IBAction func SaveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newpainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //Atributes ekleme
        
        newpainting.setValue(nameTextField.text!, forKey: "name")
        newpainting.setValue(artistTextField.text!, forKey: "artist")
        
        if let year = Int(yearTextField.text!) {
            newpainting.setValue(year, forKey: "year") // düzeltilmiş satır
        }

        newpainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        newpainting.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("success")
        }
        catch{
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
