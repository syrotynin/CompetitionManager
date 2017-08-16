//
//  CompTypeTableViewCell.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 8/16/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import UIKit

protocol CompTypeDelegate: NSObjectProtocol {
    func infoClicked(cell: CompTypeTableViewCell)
}

class CompTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var screen: UIImageView!
    
    weak var delegate: CompTypeDelegate?
    
    static let identifier = "CompTypeCell"
    static let closedHeight: CGFloat = 40
    static let openedHeight: CGFloat = 150
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func infoClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.infoClicked(cell: self)
        }
    }
    
    func expand(_ open: Bool, type: CompetitionType) {
        UIView.animate(withDuration: 0.3) { 
            self.screen.image = open ? type.image : nil
            self.layoutIfNeeded()
        }
    }
}
