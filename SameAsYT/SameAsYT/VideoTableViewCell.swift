//
//  VideoTableViewCell.swift
//  SameAsYT
//
//  Created by Ali Atakan AKMAN on 23.06.2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var tags: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var shortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(video : Video) {
        print(video.title)
        tags.text = video.tag
        title.text = video.title
        shortDescription.text = video.shortDescription
        img.load(url: video.image_url)
        
        
    }

}


//ImageView sınıfına ek bir extension yazdık, amacımız target olarak gelen url data olarak vermesi.
extension UIImageView {
    func load(url : URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
