//
//  SettingsViewController.swift
//  ParseApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        PFUser.logOutInBackground { (error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: "Some problems", preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(okButton)
                
                self.present(alert, animated: true, completion: nil)
                    
            }else {
                
                self.performSegue(withIdentifier: "toViewController", sender: nil)
                
            }
            
        }
        
    }
    
    
}
