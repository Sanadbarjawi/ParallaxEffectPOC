//
//  sideMenuTableViewCell.swift
//  ParallaxEffectPOC
//
//  Created by Sanad  on 2/11/18.
//  Copyright © 2018 Sanad . All rights reserved.
//

import UIKit

class sideMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
