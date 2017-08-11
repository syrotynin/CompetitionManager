//
//  UserTableViewCell.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 8/11/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
