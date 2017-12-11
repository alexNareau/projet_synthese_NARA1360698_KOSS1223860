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

 
 class ViewController: UIViewController, UITableViewDataSource {
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
    //var audioPlayer: AVAudioPlayer?
    
    
    @IBOutlet weak var CVpays: UITableView!
    
    @IBAction func debutVid(_ sender: UIButton) {

        if let path = Bundle.main.path(forResource: "video", ofType: "mp4")  //accès au url de la vidéo
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path)) //accès à la vidéo elle-même
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
    @IBAction func bouttonRecherche(_ sender: Any) {
        VersPageRecherche()
    }
    
    //var backgroundPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* if let filePath = Bundle.main.path(forResource:"Discovery Hit", ofType:".mp3"){
            let fileURL = URL(fileURLWithPath:filePath)
            do{
                audioPlayer = try
                AVAudioPlayer(contentsOf:fileURL)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }catch{
                print(error)
            }
        }*/
        print("i'm master")
        donneesDePays()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
 
    //MARK:- Obtension de données
    func donneesDePays(){
       let urlCountryApi = "http://countryapi.gear.host/v1/Country/getCountries"
       let _dataCA = try! Data(contentsOf: URL(string: urlCountryApi)!)
       self.donneesPays = try! JSONDecoder().decode(Pays.self, from: _dataCA)
       self.afficherDonneesDePays()
        
    }
    
    func afficherDonneesDePays(){
        for content in (donneesPays?.Response)! {
            let _noms = content.Name
            let _alpha2Codes = content.Alpha2Code
            let _regions = content.Region
            let _latitudes = content.Latitude
            let _longitudes = content.Longitude
            let _monnaies = content.CurrencyName
            let _drapeaux = content.FlagPng
            
            
            
            
        }
       
        
    }
    
    //MARK:- Segue
    
   
   func VersPageRecherche(){
        performSegue(withIdentifier: "versRecherche", sender: nil)
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        selectionDeBase = CVpays.indexPath(for: sender as! UITableViewCell)!.row
      
        
       
    } //  prepare(for segue
    
    
}


 

