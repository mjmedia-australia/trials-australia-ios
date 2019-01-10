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

    weak var router: EventsRoutable?

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

        navigationItem.title = "All Events"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        let nib = UINib(nibName: CellIdentifier.eventList.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifier.eventList.rawValue)
    }

    func loadRecords() {
        EventsAPI.getEventsList(url: URL(string: "https://dev-api.trials.com.au/api/future-events")!) { (response, error) in
            if let response = response {
                self.viewModels = response.data.map { EventPartialViewModel(event: $0)}
                self.tableView.reloadData()
            } else {
                var title = "Error"
                var description = "Unknown Error"

                if let trialsError = error {
                    title = trialsError.errorTitle()
                    description = trialsError.errorDescription()
                }
                let controller = UIAlertController(title: title, message: description, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
            }
        }
    }

}

extension EventsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel: EventPartialViewModel = viewModels[indexPath.row]
        router?.loadEvent(id: String(viewModel.id))
    }
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
        let viewModel: EventPartialViewModel = viewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }

}
