//
//  Withdrawl.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 27/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit
import EVReflection

class Withdrawl: EVObject {
    
    var date: String?
    var value: String?
    
    open override func propertyMapping() -> [(String?, String?)] {
        return  [
            ("createdAt", nil),
            ("updatedAt", nil)
        ]
    }
}
