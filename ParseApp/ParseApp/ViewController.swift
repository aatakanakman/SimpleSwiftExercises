//
//  ViewController.swift
//  ParseApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    var click = false;

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var hiddenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    
    @IBAction func hiddenButton(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        if sender.isSelected == false {
            passwordTextField.isSecureTextEntry = true
        }else {
            passwordTextField.isSecureTextEntry = false
            
        }
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        if userNameTextField.text != "" && passwordTextField.text != "" {
            
            PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if user != nil {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }else{
                    self.errorMessage(title: "Error", message: error?.localizedDescription ?? "An unknown error has occurred")
                }
            }
        }else{
            errorMessage(title: "Error", message: "Username or password required")
        }
    }
    
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        if(userNameTextField.text != "" && passwordTextField.text != "")  {
        
            let user = PFUser();
            user.username = userNameTextField.text
            user.password = passwordTextField.text
            
            user.signUpInBackground { (success, error) in
                
                if error != nil {
                    self.errorMessage(title: "Error", message: error?.localizedDescription ?? "An unknown error has occurred")
                }else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        }else{
            errorMessage(title: "Error", message: "Username or password is required.")
        }
    }
    
    
    
    
    func errorMessage(title : String , message : String){
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil )
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}

