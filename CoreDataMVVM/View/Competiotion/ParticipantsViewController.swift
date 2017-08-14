//
//  ParticipantsViewController.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import UIKit
import AlamofireImage

class ParticipantsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var selectedNames: UILabel!
    @IBOutlet weak var namesHeight: NSLayoutConstraint!
    
    let viewModel = ParticipantsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        // bind to search field
        viewModel.searchString.bidirectionalBind(to: searchField.reactive.text)
        
        // table view data source
        viewModel.searchResults.bind(to: tableView) { dataSource, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
            let participant = dataSource[indexPath.row]
            cell.name.text = participant.name
            
            DispatchQueue.main.async() {
                UIView.animate(withDuration: 0.5, animations: {
                    let alpha: CGFloat = self.viewModel.isSelected(participant) ? 1.0 : 0.0
                    cell.checkImage.alpha = alpha
                })
            }
            
            if let photo = participant.photoURL, let url = URL(string: photo) {
                cell.photo.af_setImage(withURL: url)
            }
            
            return cell
        }
        
        // cell did selected
        tableView.selectedRow.observeNext { row in
            print("Tapped row at index \(row).")
            self.viewModel.selected(row)
        }.dispose(in: bag)

        // observing array of selected users
        _ = viewModel.selectedParticipants.observeNext { (participants) in
            self.tableView.reloadData()
            self.doneButton.isEnabled = participants.dataSource.count > 0
            
            var usernames = ""
            for user in participants.dataSource {
                usernames = usernames + user.name + " "
            }
            
            self.selectedNames.text = usernames
        }
        
        // error message observing
        _ = viewModel.errorMessages.observeNext {
            [unowned self] error in
            
            let alertController = UIAlertController(title: "Something went wrong :-(", message: error, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            let actionOk = UIAlertAction(title: "OK", style: .default,
                                         handler: { action in alertController.dismiss(animated: true, completion: nil) })
            
            alertController.addAction(actionOk)
        }
    }
}
