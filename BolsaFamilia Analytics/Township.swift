//
//  Township.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 28/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit
import EVReflection

open class Township: EVObject {
    open var municipio: String?
    open var valor: String?
    open var estado: String?
    
    open override func propertyMapping() -> [(String?, String?)] {
        return  [
            ("createdAt", nil),
            ("updatedAt", nil)
        ]
    }
}
