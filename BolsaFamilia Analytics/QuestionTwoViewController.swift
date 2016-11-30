//
//  QuestionTwoViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class QuestionTwoViewController: BaseViewController {

    @IBOutlet weak var lblResponse: UILabel!
    @IBOutlet weak var lblJSON: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        majorInvestimentsForTownship()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func majorInvestimentsForTownship() {
        startActivityIndicator()
        
        AnswersAPI.retrieveMajorTownship { (township, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                }
                
            } else {
                if let townshipNN = township {
                    if let municipio = townshipNN.municipio {
                        if let valor = townshipNN.valor {
                            if let estado = townshipNN.estado {
                                DispatchQueue.main.async {
                                    self.stopActivityIndicator()
                                    self.lblResponse.text = "O município \(municipio) do estado de \(estado) recebeu mais investimentos no valor de \(valor)R$ entre os meses Jan/Fev de 2015"
                                    self.lblJSON.text = String(townshipNN.description)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}
