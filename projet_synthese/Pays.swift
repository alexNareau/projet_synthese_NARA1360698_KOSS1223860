//
//  Pays.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-13.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import Foundation
struct Pays: Codable {
    var response: Array<Response>

    
}

struct Response: Codable {
    var Name: String
}

