//
//  ViewController.swift
//  ParseApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func loginButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toTabBar", sender: nil)
        
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        
    }
}

