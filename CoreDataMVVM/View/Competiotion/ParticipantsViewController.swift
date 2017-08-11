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
    @IBOutlet weak var selectedNames: UILabel!
    @IBOutlet weak var namesHeight: NSLayoutConstraint!
    
    let viewModel = ParticipantsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        
        viewModel.searchString.bidirectionalBind(to: searchField.reactive.text)
        
        viewModel.searchResults.bind(to: tableView) { dataSource, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
            let participant = dataSource[indexPath.row]
            cell.name.text = participant.name
            
            // load track image
//            let backgroundQueue = DispatchQueue(label: "backgroundQueue",
//                                                qos: .background,
//                                                attributes: .concurrent,
//                                                autoreleaseFrequency: .inherit,
//                                                target: nil)
//            cell.photo.image = nil
//            backgroundQueue.async {
//                if let imageData = try? Data(contentsOf: track.url) {
//                    DispatchQueue.main.async() {
//                        cell.photo.image = UIImage(data: imageData)
//                    }
//                }
//            }
            
            return cell
        }

        // TODO: bind selected to selectedNames label
//        viewModel.searchResults
//            .map {$0.name ?? ""}
//            .bind(to: selectedNames.reactive.text)
        
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
