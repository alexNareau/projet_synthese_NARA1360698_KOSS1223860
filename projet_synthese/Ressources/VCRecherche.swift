//
//  VCRecherche.swift
//  projet_synthese
//
//  Created by Etudiant on 17-11-27.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class VCRecherche: UIViewController/*, UITableViewDataSource */{
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accesDonnees?.
    }
    
   /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCellule = UITableViewCell()
        newCellule.textLabel!.text = "This is a test\(indexPath.row)"
        return newCellule
    }*/*/
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(ViewController.donneesDePays)
        // Do any additional setup after loading the view.
       
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
