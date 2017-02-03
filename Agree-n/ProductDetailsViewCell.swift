//
//  ProductDetailsViewCell.swift
//  Agree-n
//
//  Created by Alessandro Armando on 03/02/2017.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class ProductDetailsViewCell: UITableViewCell {
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detailInfo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
