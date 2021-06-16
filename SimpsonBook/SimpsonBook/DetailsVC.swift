//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Ali Atakan AKMAN on 27.05.2020.
//  Copyright © 2020 Ali Atakan AKMAN. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    //Seçilecek olan simpson u  belirlemek için
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
    }
    

    
    
 

}
