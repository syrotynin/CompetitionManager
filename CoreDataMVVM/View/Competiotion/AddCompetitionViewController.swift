//
//  AddCompetitionViewController.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import UIKit

class AddCompetitionViewController: UIViewController {

    @IBOutlet weak var competitionName: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    static let cellId = "CompCell"
    let viewModel = CompetitionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: AddCompetitionViewController.cellId)
        
        //---//
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.title.bidirectionalBind(to: competitionName.reactive.text)
    }
    
    // MARK: Actions
    
    @IBAction func imageClicked(_ sender: Any) {
        print("Select Image")
    }
}
