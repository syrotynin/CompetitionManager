//
//  ParticipantsViewController.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import UIKit

class ParticipantsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var viewModel: ParticipantsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        
        
    }
}
