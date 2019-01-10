//
//  EventDetailViewController.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    private(set) var eventId: String
    private(set) var viewModel: EventDetailViewModel?

    init(eventId: String) {
        self.eventId = eventId
        super.init(nibName: "EventDetailViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        EventsAPI.getEventsDetail(url: URL(string: "https://dev-api.trials.com.au/api/events/807")!) { (response, error) in
            if let response = response {
                self.viewModel = EventDetailViewModel(event: response.data)
                self.updateUI()
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

    func setupUI() {
        navigationItem.title = "Victorian Event"
        let shareButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: .tappedShare)
        navigationItem.rightBarButtonItem = shareButton
    }

    func updateUI() {
        guard let viewModel = viewModel else { return }

        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
        label.text = viewModel.name
        stackView.addArrangedSubview(label)
    }

    @objc func tappedShare(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: ["This is the text that we will share about our event.", URL(string: "https://trials.com.au/victoria/events/662/glenmaggie-easter-trial-2018-vic")! ], applicationActivities: nil)
        activityViewController.setValue("\"Glenmaggie 2018\" in the Trials Australia App", forKey: "subject")
        activityViewController.completionWithItemsHandler = { activity, success, items, error in
            if success, let anActivity = activity {
                print("\(anActivity.rawValue)")
            }
        }

        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.rightBarButtonItem
        }

        self.present(activityViewController, animated: true)
    }
}

private extension Selector {
    static var tappedShare = #selector(EventDetailViewController.tappedShare(_:))

}
