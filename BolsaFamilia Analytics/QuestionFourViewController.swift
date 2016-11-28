//
//  QuestionFourViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class QuestionFourViewController: UIViewController {
    @IBOutlet weak var lblResponse: UILabel!
    @IBOutlet weak var lblJSON: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        retrieveStateMost()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func retrieveStateMost() {
        AnswersAPI.retrieveStateMostFavored { (estate, error) in
            if let _ = error {
            
            } else {
                if let estateNN = estate {
                    
                    if let uf = estateNN.uf {
                        if let value = estateNN.valor {
                            DispatchQueue.main.async {
                                self.lblResponse.text = "O estado \(uf) foi o estado que mais recebeu recusos totalizando em um valor de \(value)R$"
                                
                                self.lblJSON.text = String(estateNN.description)
                            }
                        }
                    }
                    
                }
            }
        }
    }

}
