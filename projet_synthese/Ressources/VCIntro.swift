//
//  VCIntro.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-27.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VCIntro: UIViewController {
    
    /**
     
     - Auteur:
     Susyane Koschinsky
     
     - Retourne:
        -Le nom du chemin complet pour la ressource identifié par le nom et l'extension du fichier.
     
     - Envoi:
        -Discovery Hit.mp3
     
     - Paramètre:
        - forResources: le nom de la ressource. Ne peut pas être vide.
        - ofType: Le nom de l'extention. Ne peut pas être vide.
        - fileUrlWithPath:Initialise un nouveau fichier créé. Peux être vide.
     
     - Description détaillée:
        -Fonction qui permet de faire jouer une musique dès l'ouverture de l'application.
     */
    
    var audioPlayer: AVAudioPlayer?

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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.VersPageAccueil()
        }
    }

    /**
     
     - Auteur:
        Alexandre Nareau
     
     - Retourne:
        - Un segue qui permet d'aller à la page Accueil.
     
     - Envoi:
        - identifiant "versAccueil"
     
     
     - Paramètre:
        - performSegue: initie le segue
     
     - Description détaillée:
     - Fonction qui permet de changer de page pour aller à la page d'accueil.
     */
    
    func VersPageAccueil(){
        performSegue(withIdentifier: "versAccueil", sender: nil)
        
    }

}
