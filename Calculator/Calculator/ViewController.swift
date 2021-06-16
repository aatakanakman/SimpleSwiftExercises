//
//  ViewController.swift
//  Calculator
//
//  Created by Ali Atakan AKMAN on 16.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ilkText: UITextField!
    @IBOutlet weak var ikinciText: UITextField!
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var degisken = 20
        
    }
    
    @IBAction func artıButon(_ sender: Any) {
        
        
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                
                sonuc = ilkSayi+ikinciSayi
                sonucLabel.text = String(sonuc)
            }
        }
//        let ilkSayi = Int(ilkText.text!)!
//        let ikinciSayi = Int(ikinciText.text!)!
       
    }
    
    @IBAction func eksiButon(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                
                sonuc = ilkSayi-ikinciSayi
                sonucLabel.text = String(sonuc)
            }
        }
        
    }
    
    @IBAction func bölüButon(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                
                sonuc = ilkSayi/ikinciSayi
                sonucLabel.text = String(sonuc)
            }
        }
        
    }
    
    @IBAction func çarpıButon(_ sender: Any) {
        
        if let ilkSayi = Int(ilkText.text!){
            if let ikinciSayi = Int(ikinciText.text!){
                
                sonuc = ilkSayi*ikinciSayi
                sonucLabel.text = String(sonuc)
            }
        }
        
    }
}

