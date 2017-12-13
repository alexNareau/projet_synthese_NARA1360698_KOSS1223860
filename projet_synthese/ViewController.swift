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



 
class ViewController: UIViewController {
 
    var donneesPays: Pays?
    var audioPlayer: AVAudioPlayer?
    
    /**
     - Auteur:
     Susyane Koschinsky
     
     - Retourne:
     Le nom du chemin complet pour la ressource identifié par le nom et l'extension du fichier.
     
     - Envoi:
     video.mp4
     
     - Paramètre:
         - forResources: le nom de la ressource. Ne peut pas être vide.
         - ofType: Le nom de l'extention. Ne peut pas être vide.
     
     - Description détaillée:
     Fonction qui permet de faire jouer une vidéo format mp4 dans l'application.
     */
    
    @IBAction func debutVid(_ sender: UIButton) {

        if let path = Bundle.main.path(forResource: "animationprod", ofType: "mp4")  //accès au url de la vidéo
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path)) //accès à la vidéo elle-même
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
    }
    
    
    
    var backgroundPlayer = AVAudioPlayer()
    
    /**
     
     - Auteur:
     Susyane Koschinsky
     
     - Retourne:
     Le nom du chemin complet pour la ressource identifié par le nom et l'extension du fichier.
     
     - Envoi:
     Discovery Hit.mp3
     
     - Paramètre:
         - forResources: le nom de la ressource. Ne peut pas être vide.
         - ofType: Le nom de l'extention. Ne peut pas être vide.
         - fileUrlWithPath:Initialise un nouveau fichier créé. Peux être vide.
     - Description détaillée:
     Fonction qui permet de faire jouer une musique dès l'ouverture de l'application.
     */

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
        print("i'm master")
        donneesDePays()
        
        //createFloatingButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
 /**
     
     - Auteur:
     Alexandre Nareau
     
     - Retourne:
     Les données de l'API country
     
     - Envoi:
     http://countryapi.gear.host/v1/Country/getCountries
     
     - Paramètre:
         - contentsOf:
     
     - Description détaillée:
     Fonction qui permet de prendre les données de l'API country et de les décoder en JSON.
  */
    //MARK:- Obtension de données
    func donneesDePays(){
        let urlCountryApi = "http://countryapi.gear.host/v1/Country/getCountries"
        
        if let _dataCA = NSData(contentsOf: URL(string: urlCountryApi)!) as Data?{
            self.donneesPays = try! JSONDecoder().decode(Pays.self, from: _dataCA)
            
            
            
            
            self.afficherDonneesDePays()
            
            
        }
        
    }
    /**
     
     - Auteur:
     Alexandre Nareau
     
     - Retourne:
     
     - Envoi:
     
     - Paramètre:
     
     - Description détaillée:
     */
    func afficherDonneesDePays(){
        
        for content in (donneesPays?.Response)! {
            let _noms = content.Name
            let _alpha2Codes = content.Alpha2Code
            let _regions = content.Region
            let _latitudes = content.Latitude
            let _longitudes = content.Longitude
            let _monnaies = content.CurrencyName
            let _drapeaux = content.FlagPng
            
            
            print(_noms, _regions)
            
        }
        
        
    }
    
  /*  private func createFloatingButtons(){
        cells.append(createButtonCell("ic_cloud"))
    }
    
    private func createButtonCell(iconName: String ->LiquidFloatingCell){
        
    }*/

}

  
  
