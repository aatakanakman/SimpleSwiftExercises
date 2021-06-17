//
//  ViewController.swift
//  UserDefault
//
//  Created by Ali Atakan AKMAN on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var notTextField: UITextField!
    
    @IBOutlet weak var zamanTextField: UITextField!
    
    @IBOutlet weak var notLabel: UILabel!
    
    @IBOutlet weak var zamanLabel: UILabel!
    
    var girilenNot = ""
    var yapilacakZaman = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        //as -> casting
        
        if let gelenNot = kaydedilenNot as? String {
            
            notLabel.text = "Yapılacak iş : \(gelenNot)";
            
        }
        
        if let gelenZaman = kaydedilenZaman as? String {
            
            zamanLabel.text = "Yapılacak zaman : \(gelenZaman)";
            
        }
        
        
    }
    
    
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        
        UserDefaults.standard.set(notTextField.text!, forKey: "not")
        UserDefaults.standard.set(zamanTextField.text!, forKey: "zaman")
        
        girilenNot = notTextField.text!
        yapilacakZaman = zamanTextField.text!
        
        
        notLabel.text = "Yapılacak iş :\(girilenNot)"
        zamanLabel.text = "Yapılacak zaman :\(yapilacakZaman)"
        
    }
    
    @IBAction func silTiklandi(_ sender: Any) {
        
        let kaydedilenNot = UserDefaults.standard.object(forKey: "not")
        let kaydedilenZaman = UserDefaults.standard.object(forKey: "zaman")
        
        
        if (kaydedilenNot as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "not")
            notLabel.text = "Yapılacak iş : "
        }
        
        if (kaydedilenZaman as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "zaman")
            zamanLabel.text = "Yapılacak zaman : "
        }
    }
    

}

