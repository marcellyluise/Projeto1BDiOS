//
//  CRUDViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class CRUDViewController: BaseViewController {
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnRetrieve: UIButton!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var btnDelete: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customize()
    }
    
    func customize() {
        let borderColor = UIColor(red: 239/255, green: 99/255, blue: 102/255, alpha: 1.0)
        
        btnCreate.layer.borderColor = borderColor.cgColor
        btnRetrieve.layer.borderColor = borderColor.cgColor
        btnUpdate.layer.borderColor = borderColor.cgColor
        btnDelete.layer.borderColor = borderColor.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CRUDCreate" {
            let destinationVC = segue.destination as! CRUDCreateViewController
            destinationVC.title = "Create"
            destinationVC.isCRUDCreate = true
        }
        
        if segue.identifier == "CRUDUpdate" {
            let destinationVC = segue.destination as! CRUDCreateViewController
            destinationVC.title = "Update"
            destinationVC.isCRUDUpdate = true
        }
        
        if segue.identifier == "CRUDDelete" {
            let destinationVC = segue.destination as! CRUDCreateViewController
            destinationVC.title = "Delete"
            destinationVC.isCRUDDelete = true
        }
        
        if segue.identifier == "CRUDRetrieve" {
            let destinationVC = segue.destination as! CRUDRetrieveViewController
            destinationVC.title = "Retrieve"
        }
    }
    
}
