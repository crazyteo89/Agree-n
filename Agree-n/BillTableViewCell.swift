//
//  BillTableViewCell.swift
//  Agree-n
//
//  Created by Matteo Palmieri on 05/02/17.
//  Copyright © 2017 Matteo Palmieri. All rights reserved.
//

import UIKit

class BillTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet var billImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
