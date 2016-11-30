//
//  CRUDRetrieveViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class CRUDRetrieveViewController: BaseViewController {

    @IBOutlet weak var btnQuestion1: UIButton!
    @IBOutlet weak var btnQuestion2: UIButton!
    @IBOutlet weak var btnQuestion3: UIButton!
    @IBOutlet weak var btnQuestion4: UIButton!
    
    @IBOutlet weak var lblResponse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retrieveQuestionOne(_ sender: Any) {
        startActivityIndicator()
        AnswersAPI.retrieveMajorFavorited { (favored, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                }
            } else {
                if let majorFavored = favored {
                    DispatchQueue.main.async {
                        self.stopActivityIndicator()
                        self.lblResponse.text = String(majorFavored.description)
                    }
                }
            }
        }
    }
    
    @IBAction func retrieveQuestionTwo(_ sender: Any) {
        startActivityIndicator()
        
        AnswersAPI.retrieveMajorTownship { (township, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                }
            } else {
                if let townshipNN = township {
                    DispatchQueue.main.async {
                        self.stopActivityIndicator()
                        self.lblResponse.text = townshipNN.description
                    }
                }
            }
        }
    }
    
    
    @IBAction func retrieveQuestionThree(_ sender: Any) {
        let alert = UIAlertController(title: "Pergunta 3️⃣", message: "Obtenha essa leitura na tela de perguntas.", preferredStyle: .alert)
        let action = UIAlertAction(title: "👍🏻", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func retrieveQuestionFour(_ sender: Any) {
        startActivityIndicator()
        
        AnswersAPI.retrieveStateMostFavored { (state, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                }
            } else {
                if let stateNN = state {
                    DispatchQueue.main.async {
                        self.stopActivityIndicator()
                        self.lblResponse.text = stateNN.description
                    }
                }
            }
        }
    }
}
