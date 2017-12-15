//
//  VCPays.swift
//  projet_synthese
//
//  Created by Etudiant on 17-12-04.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit
import MapKit



class VCPays: UIViewController {

    var vc: ViewController?
    var myPosition:Reponse!
    let regionRadius: CLLocationDistance = 3000000
    
    /**
     
     - Auteur:
     Alexandre Nareau
     
     - Retourne:
        - Le pays sélectionné sur la map.
     
     - Envoi:
        - Les coordonnées spécifiées.
     
     - Paramètre:
        - MKCoordinateRefionMakeWithDistance: Créé une nouvelle MKCoordinateRegion avec les coordonnées spécifiées.
     
     - Description détaillée:
        - Fonction qui permet de faire afficher le Pays sélectionné dans la map.
     */
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        affichageMap.setRegion(coordinateRegion, animated: true)
    }
 
    @IBAction func ajoutFavoris(_ sender: Any) {
    }
    
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
    @IBOutlet weak var affichageMap: MKMapView!
    
    /**
     
    - Auteur:
     Alexandre Nareau
     
     - Retourne:
        - La latitude et la longitude du pays sélectionné.
     
     - Envoi:
        - Les données du pays sélectionné.
     
     - Paramètre:
        - doubleValue: la valeur du String doublé.
        - CLLocation: la longitude et latitude rapporté par le système.
     
     - Description détaillée:
        - Fonction qui est appelée lorsque le controller est loadé.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        let iX = (myPosition.Latitude as NSString).doubleValue
        let iY = (myPosition.Longitude as NSString).doubleValue
        let initialLocation = CLLocation(latitude: iX, longitude: iY)
       
        
        print("loader", myPosition)
        affichagePays.text = myPosition.Name
        affichageCode.text = "AlphaCode: \(myPosition.Alpha2Code)"
        affichageRegion.text = "Région: \(myPosition.Region)"
        affichageMonnaie.text = "Monnaie: \(myPosition.CurrencyName)"
        affichageLatitude.text = "Latitude: \(myPosition.Latitude)"
        affichageLongitude.text = "Longitude: \(myPosition.Longitude)"
        centerMapOnLocation(location: initialLocation)
    }
    /**
     
     - Auteur:
     Alexandre Nareau
     
     - Retourne:
        -Le drapeau du Pays sélectionné.
     
     - Envoi:
        - Les informations dy pays sélectionné.
     
     - Paramètre:
        - URL: identifie l'endroit de la ressource.
     
     - Description détaillée:
     - Fonction qui permet de notifier au controller que cette "view" va être ajoutée à la hiérarchie. Permet aussi d'Afficher le drapeau du pays sélectionné.
     */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageUrlString =  myPosition.FlagPng
        let imageUrl:URL = URL(string: imageUrlString)!
        
        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            
            
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                self.affichageDrapeau.image = image
   
            }
        }
    }
}
