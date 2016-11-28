//
//  CRUDViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class CRUDViewController: UIViewController {
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnRetrieve: UIButton!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var btnDelete: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        customize()
        
        
    }
    
    func customize() {
        btnCreate.layer.borderColor = UIColor.darkGray.cgColor
        btnRetrieve.layer.borderColor = UIColor.darkGray.cgColor
        btnUpdate.layer.borderColor = UIColor.darkGray.cgColor
        btnDelete.layer.borderColor = UIColor.darkGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func insetFavored() {
    
    }
    
    @IBAction func create(_ sender: Any) {
    }

    @IBAction func retrieve(_ sender: Any) {
    }
    
    @IBAction func update(_ sender: Any) {
    }
    
    @IBAction func crudDelete(_ sender: Any) {
        
    }
    
}
