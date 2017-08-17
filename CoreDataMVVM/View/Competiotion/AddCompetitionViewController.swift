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
    
    let viewModel = CompetitionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = CompTypeTableViewCell.closedHeight
        
        // remove empty cells
        tableView.tableFooterView = UIView()
        
        //---//
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.title.bidirectionalBind(to: competitionName.reactive.text)
        viewModel.title.map({
            let string = $0?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            return string.characters.count > 0
            })
            .bind(to: doneButton.reactive.isEnabled)
        
        viewModel.competitionTypes.bind(to: tableView) { dataSource, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: CompTypeTableViewCell.identifier, for: indexPath) as! CompTypeTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            
            let competitionType = dataSource[indexPath.row]
            let selected = self.viewModel.isSelected(competitionType)
            
            let check: String = selected ? "  ✔︎" : ""
            cell.name.text = competitionType.description + check
            cell.name.font = selected ? UIFont.boldSystemFont(ofSize: 18.0) : UIFont.systemFont(ofSize: 16.0)
            
            let expanded = self.viewModel.expandedRows.contains(indexPath.row)
            cell.expand(expanded, type: competitionType)
            
            return cell
        }
        
        // cell did selected
        tableView.selectedRow.observeNext { row in
            print("Selected row at index \(row).")
            self.viewModel.selectType(row)
            self.tableView.reloadData()
        }.dispose(in: bag)
    }
    
    // MARK: - Actions
    
    @IBAction func imageClicked(_ sender: Any) {
        print("Select Image")
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        CoreDataManager.shared.addCompetition(name: competitionName.text ?? "", success: { (competition) in
            performSegue(withIdentifier: Segue.selectParticipants, sender: competition)
        }) { (error) in
            let alertController = UIAlertController(title: "Something went wrong :-(", message: error.localizedDescription, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            let actionOk = UIAlertAction(title: "OK", style: .default,
                                         handler: { action in alertController.dismiss(animated: true, completion: nil) })
            
            alertController.addAction(actionOk)
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.selectParticipants,
            let vc = segue.destination as? ParticipantsViewController,
            let competition = sender as? Competition {
            vc.viewModel.competition = competition
        }
    }
}

extension AddCompetitionViewController: CompTypeDelegate {
    func infoClicked(cell: CompTypeTableViewCell) {
        if let ip = tableView.indexPath(for: cell) {
            viewModel.trigger(ip.row)
            self.tableView.reloadData()
        }
    }
}
