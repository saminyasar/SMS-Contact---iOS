//
//  ContactTableCell.swift
//  ContactShare
//
//  Created by Samin Yasar on 2/22/17.
//  Copyright © 2017 Appdragon. All rights reserved.
//

import UIKit

class ContactTableCell: UITableViewCell {

    
    @IBOutlet var contactImgView: UIImageView!
    @IBOutlet var contactNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
