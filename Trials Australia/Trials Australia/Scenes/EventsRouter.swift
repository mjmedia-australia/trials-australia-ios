//
//  EventsRouter.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

protocol EventsRoutable: class {
    func loadEvent(id: String)
}

class EventsRouter {

    var navigationController: UINavigationController?

    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: "Events", image: UIImage(named: "map_marker"), tag: 0)
    }

    func rootViewController() -> UIViewController {
        let viewController = eventsListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        setupUI()
        return navigationController
    }

    func setupUI() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.setBackgroundImage(UIImage(color: EventsStyle.Navigation.backgroundColor), for: .default)
        navigationController.navigationBar.barTintColor = EventsStyle.Navigation.backgroundColor
        navigationController.navigationBar.backgroundColor = EventsStyle.Navigation.backgroundColor
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = EventsStyle.Navigation.tintColor
        navigationController.navigationBar.titleTextAttributes = EventsStyle.Navigation.titleAttributes
        navigationController.navigationBar.shadowImage = UIImage()
    }

    func eventsListViewController() -> EventsListViewController {
        let viewController = EventsListViewController()
        viewController.router = self
        return viewController
    }

    func eventDetailViewController(id: String) -> EventDetailViewController {
        return EventDetailViewController(eventId: id)
    }
}

extension EventsRouter: EventsRoutable {
    func loadEvent(id: String) {
        let detail = eventDetailViewController(id: id)
        navigationController?.pushViewController(detail, animated: true)
    }
}
