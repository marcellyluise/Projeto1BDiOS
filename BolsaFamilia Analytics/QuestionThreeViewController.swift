//
//  QuestionThreeViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

class QuestionThreeViewController: UIViewController {

    @IBOutlet weak var tblEstates: UITableView!
    
    var results: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        retrieveEstatesBudge()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func retrieveEstatesBudge() {
        AnswersAPI.retrieveEstatesBudge { (dictionary, error) in
            if let _ = error {
            } else {
                if let dic = dictionary {
                    DispatchQueue.main.async {
                        self.results = NSDictionary(dictionary: dic)
                        self.tblEstates.reloadData()
                    }
                    
                    
                }
            }
           
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QuestionThreeViewController: UITableViewDelegate {
}

extension QuestionThreeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let resultsNN = results {
            return resultsNN.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstatesBudgeCell", for: indexPath)
        
        if let resultsNN = results {
            let keys = Array(arrayLiteral: resultsNN.allKeys)
            let values = Array(arrayLiteral: resultsNN.allValues)
            
            cell.textLabel?.text = "\(keys[0][indexPath.row]): \(values[0][indexPath.row])R$"
        }
        return cell
    }
}


