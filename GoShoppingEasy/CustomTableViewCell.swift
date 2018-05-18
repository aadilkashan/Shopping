//
//  CustomTableViewCell.swift
//  GoShoppingEasy
//
//  Created by Apple on 17/04/18.
//  Copyright © 2018 tryCatch. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
