//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Rabia Cırık on 23.06.2025.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmarkRole = [String]()
    var chooseNames = ""
    var chooseImages = UIImage()
    var chooseRole = ""
    

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        
        landmarkNames.append("J-Hope")
        landmarkNames.append("Jimin")
        landmarkNames.append("Jin")
        landmarkNames.append("jungkook")
        landmarkNames.append("RM")
        landmarkNames.append("Suga")
        landmarkNames.append("V")
        
        landmarkRole.append("Rapper")
        landmarkRole.append("Lead Vokal")
        landmarkRole.append("Vokal")
        landmarkRole.append("Rapper")
        landmarkRole.append("Main Rapper")
        landmarkRole.append("Main Rapper")
        landmarkRole.append("Alt Vokalist")

        
        landmarkImages.append(UIImage(named: "J-Hope")!)
        landmarkImages.append(UIImage(named: "Jimin")!)
        landmarkImages.append(UIImage(named: "Jin")!)
        landmarkImages.append(UIImage(named: "Jungkook")!)
        landmarkImages.append(UIImage(named: "RM")!)
        landmarkImages.append(UIImage(named: "Suga")!)
        landmarkImages.append(UIImage(named: "V")!)
        
        
        
        


        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        content.secondaryText = landmarkRole[indexPath.row]
        //content.image = landmarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseNames = landmarkNames[indexPath.row]
        chooseImages = landmarkImages[indexPath.row]
        chooseRole = landmarkRole[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedImages = chooseImages
            destinationVC.selectedNames = chooseNames
            destinationVC.selectedRoles = chooseRole
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            self.landmarkRole.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}

