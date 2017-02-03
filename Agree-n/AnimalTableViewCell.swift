//
//  AnimalTableViewCell.swift
//  Agree-n
//
//  Created by Luca Kesler on 03/02/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    @IBOutlet var animalTitleLabel: UILabel!
    @IBOutlet var animalSubTitleLabel: UILabel!
    @IBOutlet var animalThumbnailImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
