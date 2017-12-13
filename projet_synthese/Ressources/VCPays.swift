//
//  VCPays.swift
//  projet_synthese
//
//  Created by Etudiant on 17-12-04.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class VCPays: UIViewController {

    var vc: ViewController?
    var myPosition = (Any).self
    
    
    
    
    @IBAction func retourARecherche(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var affichagePays: UILabel!
    @IBOutlet weak var affichageCode: UILabel!
    @IBOutlet weak var affichageMonnaie: UILabel!
    @IBOutlet weak var affichageRegion: UILabel!
    @IBOutlet weak var affichageLongitude: UILabel!
    @IBOutlet weak var affichageLatitude: UILabel!
    @IBOutlet weak var affichageDrapeau: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        print("JE SUIS LOADÉ")
       // let test = vc?.donneesPays?.Response[myPosition]
        //print("TESTTTTTT---------\(noms)")
        
       //affichagePays.text = Pays.Response[myPosition].Name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
