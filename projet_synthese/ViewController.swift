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
 
    var audioPlayer: AVAudioPlayer?
    
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
    
    var backgroundPlayer = AVAudioPlayer()
    
    
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
 

}

