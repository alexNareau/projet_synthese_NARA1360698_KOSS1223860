 //
//  ViewController.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-13.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Floaty
import RealmSwift

 
 class ViewController: UIViewController, UITableViewDataSource, FloatyDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return donneesPays?.Response.count ?? 0
       
    }
    
    /**
     
     - Auteur:
        Alexandre Nareau
     
     - Retourne:
        - Une cellule réutilisable du tableView.
     
     - Envoi:
        - les données des pays dans les cellules.
     
     - Paramètre:
        - tableView: Demande au data source une cellule pour y insérer les données.
     
     - Description détaillée:
        - Fonction qui permet de faire afficher un tableView avec les données à l'intérieur.
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCellule = tableView.dequeueReusableCell(withIdentifier: "laCellule", for: indexPath)
        var _nomPays = "Non définis"
        if let _sonNom = donneesPays?.Response[indexPath.row].Name{
            _nomPays = _sonNom
        }
       
        newCellule.textLabel!.text = _nomPays
        return newCellule
    }
    
    
    
    private var selectionDeBase = 0
    var donneesPays: Pays?
    var audioPlayer: AVAudioPlayer?
    
    
    
    @IBOutlet weak var CVpays: UITableView!
    
    
    @IBAction func bouttonRecherche(_ sender: Any) {
        VersPageRecherche()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        layoutFAB()
        donneesDePays()
    }

    /**
     
     - Auteur:
        Alexandre Nareau
     
     - Retourne:
        - Un menu pour naviguer dans l'application.
     
     - Envoi:
        - Les données du boutons.
     
     - Paramètre:
        - for content in
     
     - Description détaillée:
        - Fonction qui permet de faire afficher le bouton Floaty.
     */
    
    func layoutFAB() {
        let fab = Floaty()
        let item = FloatyItem()
        item.buttonColor = UIColor(red: 188/255, green: 46/255, blue: 35/255, alpha: 1)
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor(red: 188/255, green: 46/255, blue: 35/255, alpha: 0.5)
        item.title = "Custom item"
        item.handler = { item in
            
        }
        
        fab.addItem(title: "Menu"){item in self.dismiss(animated: true, completion: nil)}
        fab.addItem(title: "Credits"){item in self.performSegue(withIdentifier: "versCredit", sender: nil)}
        fab.addItem(title: "À propos"){item in self.performSegue(withIdentifier: "versAPropos", sender: nil)}
        
        
        fab.fabDelegate = self
        
        self.view.addSubview(fab)
        
    }
 
    
    /**
     
     - Auteur:
     Alexandre Nareau
     
     - Retourne:
        -Les données de l'API country
     
     - Envoi:
     http://countryapi.gear.host/v1/Country/getCountries
     
     - Paramètre:
        - contentsOf:
     
     - Description détaillée:
        -Fonction qui permet de prendre les données de l'API country et de les décoder en JSON.
     */
    
    //MARK:- Obtension de données
    func donneesDePays(){
       let urlCountryApi = "http://countryapi.gear.host/v1/Country/getCountries"
       let _dataCA = try! Data(contentsOf: URL(string: urlCountryApi)!)
       self.donneesPays = try! JSONDecoder().decode(Pays.self, from: _dataCA)
       //self.afficherDonneesDePays()
       
    }
    /**
     
     - Auteur:
        Alexandre Nareau
     
     - Retourne:
        - Un storyboardSegue, qui permet de faire la transition visuelle entre deux view controllers.
     
     - Envoi:
        - Cellule de tableView pour créer des rangées.
     
     - Paramètre:
        - prepare(for segue): Notifie le viewController qu'un segue va débuter.
     
     - Description détaillée:
        - Fonction qui permet de préparer le segue.
     */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UITableViewCell {
            selectionDeBase = CVpays.indexPath(for: sender as! UITableViewCell)!.row
            
            let destination = segue.destination as! VCPays
            destination.myPosition = donneesPays?.Response[selectionDeBase]
        }
        
    } 
    //MARK:- Segue
    /**
     
     - Auteur:
        Alexandre Nareau
     
     - Retourne:
        - Une segue qui permet d'aller à la page recherche.
     
     - Envoi:
        - identifiant "versRecherche"
     
     - Paramètre:
        - performSegue: initie le segue
     
     - Description détaillée:
        - Fonction qui permet de changer de page pour aller à la page d'accueil.
     */
   
   func VersPageRecherche(){
        performSegue(withIdentifier: "versRecherche", sender: nil)
        
    }

 
}
