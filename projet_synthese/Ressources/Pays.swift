//
//  Pays.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-13.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import Foundation

/**
 
 - Auteur:
    Alexandre Nareau
 
 - Retourne:
    -Un Array avec les données des pays
 
 - Envoi:
    - Les données des pays voulu.
 
 - Paramètre:
    - Codable: Un type qui peut se convertir.
 
 - Description détaillée:
    - Fonction qui permet de recevoir un Array des données.
 */

struct Pays: Codable {
    var Response: Array<Reponse>
}

/**
 
 - Auteur:
    Alexandre Nareau
 
 - Retourne:
    - Un String pour chaque variable.
 
 - Envoi:
    - Les données voulus.
 
 - Paramètre:
    - Codable: Un type qui peut se convertir.
 
 - Description détaillée:
    - Fonction qui permet de recevoir des Strings des variables.
 */

struct Reponse: Codable {
    var Name: String
    var Alpha2Code: String
    var Region: String
    var Latitude: String
    var Longitude: String
    var CurrencyName: String
    var FlagPng: String
}

