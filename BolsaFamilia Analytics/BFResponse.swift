//
//  BFResponse.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit
import EVReflection

open class BFResponse: EVObject {
    
    open var message: String?
    open var success: NSNumber?
    
    open override func propertyMapping() -> [(String?, String?)] {
        return  [
            ("createdAt", nil),
            ("updatedAt", nil)
        ]
    }
}
