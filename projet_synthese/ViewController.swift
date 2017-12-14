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
    
    //var backgroundPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = Bundle.main.path(forResource:"Discovery Hit", ofType:".mp3"){
            let fileURL = URL(fileURLWithPath:filePath)
            do{
                audioPlayer = try
                AVAudioPlayer(contentsOf:fileURL)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }catch{
                print(error)
            }
        }
        
        layoutFAB()
        donneesDePays()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
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
        
        /*fab.addItem("Become an Admin", icon: UIImage(named: "Contacts Filled.png")) { item in
            let alert = UIAlertController(title: "Become an Admin", message: "Send a request to be an admin and be able to write notices", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Send Request", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }*/
        fab.fabDelegate = self
        
        self.view.addSubview(fab)
        
    }
 
    //MARK:- Obtension de données
    func donneesDePays(){
       let urlCountryApi = "http://countryapi.gear.host/v1/Country/getCountries"
       let _dataCA = try! Data(contentsOf: URL(string: urlCountryApi)!)
       self.donneesPays = try! JSONDecoder().decode(Pays.self, from: _dataCA)
       //self.afficherDonneesDePays()
       
    }
    
   
    
    
    func afficherDonneesDePays(){
        //for content in (donneesPays?.Response)! {
          //  let _noms = donneesPays?.Response[selectionDeBase].Name
          //  let _alpha2Codes = content.Alpha2Code
            //let _regions = content.Region
            //let _latitudes = content.Latitude
            //let _longitudes = content.Longitude
            //let _monnaies = content.CurrencyName
            //let _drapeaux = content.FlagPng
       // }
       
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UITableViewCell {
            selectionDeBase = CVpays.indexPath(for: sender as! UITableViewCell)!.row
            
            let destination = segue.destination as! VCPays
            destination.myPosition = donneesPays?.Response[selectionDeBase]
        }
        
    } 
    //MARK:- Segue
    
   
   func VersPageRecherche(){
        performSegue(withIdentifier: "versRecherche", sender: nil)
        
    }
 
 //MARK:- Realm

    /*let realm = try! Realm()
    
    try! realm.write {
    realm.add(myDog)
    }*/
 
 
}
