//
//  CRUDCreateViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class CRUDCreateViewController: UIViewController {
    @IBOutlet weak var txtNISFavorecido: UITextField!
    @IBOutlet weak var txtNomeFavorecido: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func crudCreate(_ sender: Any) {
        if let nisFavorecido = txtNISFavorecido.text {
            if nisFavorecido.isEmpty {
            
            } else {
                if let nome = txtNomeFavorecido.text {
                    if nome.isEmpty {
                        
                    } else {
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
                }
            }
        }
    }

}
