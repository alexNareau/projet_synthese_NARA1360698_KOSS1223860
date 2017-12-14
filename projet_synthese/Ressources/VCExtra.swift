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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
