//
//  VCExtra.swift
//  projet_synthese
//
//  Created by Etudiant on 17-12-14.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VCExtra: UIViewController {
    @IBAction func retourARecherche(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /**
     - Auteur:
     Susyane Koschinsky 
     
     - Retourne:
     Le nom du chemin complet pour la ressource identifié par le nom et l'extension du fichier.
     
     - Envoi:
     animationprod.mp4 / La vidéo de présentation
     
     - Paramètre:
     - forResources: le nom de la ressource. Ne peut pas être vide.
     - ofType: Le nom de l'extention. Ne peut pas être vide.
     
     - Description détaillée:
     Fonction qui permet de faire jouer une vidéo format mp4 dans l'application.
     */
    
    @IBAction func debutVid(_ sender: UIButton) {
    print("start video")
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
    

}
