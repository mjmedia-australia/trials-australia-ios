//
//  EventsListViewController.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit
import Alamofire

class EventsListViewController: UIViewController {

    enum CellIdentifier: String{
        case eventList = "EventListTableViewCell"
    }

    @IBOutlet weak var tableView: UITableView!

    var viewModels = [EventPartialViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadRecords()
    }

    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: CellIdentifier.eventList.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifier.eventList.rawValue)
    }

    func loadRecords() {
        EventsAPI.get(url: URL(string: "https://dev-api.trials.com.au/api/future-events")!) { (response, error) in
            if let response = response {
                self.viewModels = response.data.map { EventPartialViewModel(event: $0)}
                self.tableView.reloadData()
            } else {
                let trialsError = error as! TrialsError
                let controller = UIAlertController(title: trialsError.errorTitle(), message: trialsError.errorDescription(), preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
            }
        }
    }

}

extension EventsListViewController: UITableViewDelegate {

}
extension EventsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return eventCell(for: indexPath)
    }


    func eventCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell", for: indexPath) as! EventListTableViewCell
        let record: EventPartialViewModel = viewModels[indexPath.row]
        cell.titleLabel?.attributedText = record.cellAttributedString
        cell.accessibilityLabel = title
        return cell
    }

}
