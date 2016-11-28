//
//  Connect.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 27/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit
import Alamofire

open class Connect {
    
    class func urlBase(_ endpoint: String) -> URL {
        //treate brackets and double quotes because of god Swift not replacing double quotes
        let treatedEndpoint = endpoint.replacingOccurrences(of: "{", with: "%7B").replacingOccurrences(of: "}", with: "%7D")
        let localEndpoint : String = "http://52.38.165.107/api/\(treatedEndpoint)"
        return URL(string: localEndpoint)!
    }
    
    class func makeRequest(_ baseUrl : String, parameters: [(name: String, value: String)]) -> String?{
        var components = URLComponents(string: baseUrl)
        components?.queryItems = []
        for tuple in parameters{
            let queryItem = URLQueryItem(name: tuple.name, value: tuple.value)
            components?.queryItems?.append(queryItem)
        }
        return components?.url?.absoluteString
    }
}

