//
//  ViewController.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-13.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var donneesPays: Pays?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        donneesDePays()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Obtension de données
    func donneesDePays(){
        let urlCountryApi = "http://countryapi.gear.host/v1/Country/getCountries"
        
            if let _dataCA = NSData(contentsOf: URL(string: urlCountryApi)!) as Data?{
                self.donneesPays = try! JSONDecoder().decode(Pays.self, from: _dataCA)
                //self.afficherDonneesDePays()
                
            }
        
    }
    
    func afficherDonneesDePays(){
       // let _valeurs = donneesPays
       // print(_valeurs!)
    }


}

