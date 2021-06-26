//
//  AddViewController.swift
//  RemindersApp
//
//  Created by Ali Atakan AKMAN on 27.06.2021.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    public var complation : ((String , String , Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(btnSave))
        
        
        
    }
    
    @objc func btnSave() {
        
        if let titletext = titleLabel.text, !titletext.isEmpty,
           let bodyText = bodyLabel.text , !bodyText.isEmpty {
            let targetDate = datePicker.date
            
            complation?(titletext,bodyText,targetDate)
            
        }
        
    }
}
