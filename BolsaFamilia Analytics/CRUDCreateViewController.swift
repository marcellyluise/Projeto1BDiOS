//
//  CRUDCreateViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class CRUDCreateViewController: BaseViewController {
    @IBOutlet weak var txtNISFavorecido: UITextField!
    @IBOutlet weak var txtNomeFavorecido: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    @IBOutlet weak var btnPerformCRUD: UIButton!
    
    var isCRUDCreate = false
    var isCRUDDelete = false
    var isCRUDUpdate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isCRUDUpdate {
            DispatchQueue.main.async {
                self.btnPerformCRUD.setTitle("Update", for: .normal)
            }
        }
        
        if isCRUDDelete {
            DispatchQueue.main.async {
                self.btnPerformCRUD.setTitle("Delete", for: .normal)
            }
        }
        
        if isCRUDCreate {
            DispatchQueue.main.async {
                self.btnPerformCRUD.setTitle("Create", for: .normal)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func performCRUD(_ sender: Any) {
        if let nisFavorecido = txtNISFavorecido.text {
            if nisFavorecido.isEmpty {
            
            } else {
                if let nome = txtNomeFavorecido.text {
                    if nome.isEmpty {
                        
                    } else {
                        
                        if isCRUDCreate {
                            AnswersAPI.insertFavored(withName: nome, andNIS: nisFavorecido, withCompletionHandler: { (bfResponse, error) in
                                if let deuRuim = error {
                                    DispatchQueue.main.async {
                                        self.lblResponse.text = deuRuim.localizedDescription
                                    }
                                } else {
                                    if let response = bfResponse {
                                        DispatchQueue.main.async {
                                            if let message = response.message {
                                                self.lblResponse.text = message
                                            }
                                        }
                                    }
                                }
                            })
                        }
                        
                        if isCRUDDelete {
                            // TODO: Add CRUD Delete here
                        }
                        
                        if isCRUDUpdate {
                            AnswersAPI.updateFavored(withName: nome, withNIS: nisFavorecido, withCompletionHandler: { (bfResponse, error) in
                                if let deuRuim = error {
                                    DispatchQueue.main.async {
                                        self.lblResponse.text = deuRuim.localizedDescription
                                    }
                                } else {
                                    if let response = bfResponse {
                                        if let message = response.message {
                                            DispatchQueue.main.async {
                                                self.lblResponse.text = message
                                            }
                                        }
                                    }
                                }
                            })
                        }
                        
                    }
                }
            }
        }
    }

}
