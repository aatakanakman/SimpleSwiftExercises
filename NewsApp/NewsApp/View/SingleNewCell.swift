//
//  SingleNewCell.swift
//  NewsApp
//
//  Created by Ali Atakan AKMAN on 19.06.2021.
//

import UIKit

class SingleNewCell: UITableViewCell {

    @IBOutlet weak var newTitleLabel: UILabel!
    
    @IBOutlet weak var newContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
