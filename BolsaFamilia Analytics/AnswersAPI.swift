//
//  AnswersAPI.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 27/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit
import Alamofire

open class AnswersAPI: NSObject {
    
    static let headers = ["content-type": "application/json"]
    
    class func retrieveWithdrawls(withCompletionHandle completion: @escaping (_ withdrawls: [Withdrawl]?, _ error: Error?) -> Void ) {
        
        let endPoint = Connect.urlBase("saque")
        var withdrawlsElements: [Withdrawl] = []
        
        Alamofire.request(endPoint, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200...399).responseJSON { (response) in
            if response.result.isSuccess {
                
                if let withdrawlsNN = response.result.value as? [Dictionary<String, AnyObject>] {
                    
                    for withdrawl in withdrawlsNN {
                        withdrawlsElements.append(Withdrawl(dictionary: withdrawl as NSDictionary))
                    }
                    
                    completion(withdrawlsElements, nil)
                } else {
                    completion(nil, response.result.error)
                }
            }
        }
    }
    
    class func retrieveMajorFavorited(withCompletionHandler completion: @escaping (_ favored: Favored?, _ error: Error?) -> Void) {
        let endPoint = Connect.urlBase("maior-favorecido")
        
        Alamofire.request(endPoint, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200...399).responseJSON { (response) in
            if response.result.isSuccess {
                if let favoredDic = response.result.value as? NSDictionary {
                    let favored = Favored(dictionary: favoredDic)
                    completion(favored, nil)
                } else {
                    completion(nil, response.result.error)
                }
            }
        }
    }
    
    class func insertFavored(withName name: String, andNIS nis: String, withCompletionHandler completion: @escaping (_ result: Bool?, _ error: Error?) -> Void) {
        
        let endPoint = Connect.urlBase("inserir-favorecido")
        let parameters = ["name": name, "nis_favorecido": nis]
        
        Alamofire.request(endPoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200...399).responseJSON { (response) in
            
            if response.result.isSuccess {
                completion(true, nil)
            } else {
                completion(false, response.result.error)
            }
        }
        
    }
    // http://52.38.165.107/api/inserir-favorecido
}
