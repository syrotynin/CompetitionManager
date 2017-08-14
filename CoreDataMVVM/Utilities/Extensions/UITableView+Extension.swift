//
//  UITableView+Extension.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 8/14/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import Foundation
import ReactiveKit

extension UITableView {
    var selectedRow: Signal<Int, NoError> {
        return reactive.delegate.signal(for: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))) { (subject: PublishSubject<Int, NoError>, _: UITableView, indexPath: NSIndexPath) in
            subject.next(indexPath.row)
        }
    }
}
