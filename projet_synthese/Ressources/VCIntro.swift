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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.VersPageAccueil()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func VersPageAccueil(){
        performSegue(withIdentifier: "versAccueil", sender: nil)
        
    }

}
