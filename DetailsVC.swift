//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Rabia Cırık on 23.06.2025.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var Images: UIImageView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    var selectedNames = ""
    var selectedRoles = ""
    var selectedImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text = selectedNames
        Images.image = selectedImages
        roleLabel.text = selectedRoles
    }
    

    

}
