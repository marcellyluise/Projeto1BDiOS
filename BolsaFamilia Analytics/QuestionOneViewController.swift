//
//  QuestionOneViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 27/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class QuestionOneViewController: UIViewController {
    @IBOutlet weak var lblAnswer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        retrieveAnswerOne()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Get Answer
    func retrieveAnswerOne() {
        AnswersAPI.retrieveWithdrawls { (withdrawls, error) in
            if let _ = error {
            } else {
                if let withdrawlsNN = withdrawls {
                    if let nis = withdrawlsNN[0].nis_favorecido {
                        if let value = withdrawlsNN[0].valor_parcela {
                            if let date = withdrawlsNN[0].data {
                                DispatchQueue.main.async {
                                    self.lblAnswer.text = "NIS: \(nis), Valor_Parcela: R$\(value), Data: \(date)"
                                }
                            }
                        }
                    
                    }
                }
            }
        }
    }
}
