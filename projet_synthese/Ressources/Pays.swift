//
//  Pays.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-13.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import Foundation
struct Pays: Codable {
    var Response: Array<Reponse>
    
    
}

struct Reponse: Codable {
    var Name: String
    var Alpha2Code: String
    var Region: String
    var Latitude: String
    var Longitude: String
    var CurrencyName: String
    var FlagPng: String
}

