//
//  EventDetailViewController.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit
import Kingfisher

class EventDetailViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

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

        let eventUrlString = "https://dev-api.trials.com.au/api/events/"+eventId
//        let eventUrlString = "https://dev-api.trials.com.au/api/events/807"
        EventsAPI.getEventsDetail(url: URL(string: eventUrlString)!) { (response, error) in
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

        let headerView = EventDetailHeaderView()
        headerView.configure(name: viewModel.nameAttributed, date: viewModel.dateAttributed, locationName: viewModel.locationAttributed)
        stackView.addArrangedSubview(headerView)

        let imageUrl = URL(string: "https://res.cloudinary.com/trials-australia/image/fetch/c_fill,w_800,h_600,g_face/https://trials.com.au/uploads/images/2018/af31ef53-af35-42f8-859f-14cb94bae9a3/IMG_0167.JPG")
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.kf.setImage(with: imageUrl)
        imageView.backgroundColor = EventsStyle.Detail.ImageView.backgroundColor
        imageView.heightAnchor.constraint(equalToConstant: 281).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: ViewportMetrics.screenWidth).isActive = true
        stackView.addArrangedSubview(imageView)


        if let description = viewModel.description {
            let descriptionView = EventDetailDescriptionView()
            descriptionView.configure(attributedText: description)
            stackView.addArrangedSubview(descriptionView)
        }
        let fieldsToAdd: [String?] = [
            viewModel.id,
            viewModel.address,
            viewModel.drivingDirections,
            viewModel.organiserName,
            viewModel.organiserDescription,
            viewModel.organiserWebsite?.absoluteString,
            viewModel.organiserFacebook?.absoluteString,
            viewModel.organiserInstagram?.absoluteString,
            viewModel.organiserYoutube?.absoluteString,
            viewModel.organiserTwitter?.absoluteString
        ]
        fieldsToAdd.compactMap { $0 }.forEach { addToStackView(string: $0) }
        stackView.addArrangedSubview(UIView())
    }

    func addToStackView(string: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
        label.text = string
        label.sizeToFit()
        label.numberOfLines = 0
        stackView.addArrangedSubview(label)
    }

    @objc func tappedShare(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        let activityViewController = UIActivityViewController(activityItems: [viewModel.name, URL(string: "https://trials.com.au/victoria/events/" + viewModel.id  + "/")! ], applicationActivities: nil)
        activityViewController.setValue("\"" + viewModel.name + "\" in the Trials Australia App", forKey: "subject")
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
