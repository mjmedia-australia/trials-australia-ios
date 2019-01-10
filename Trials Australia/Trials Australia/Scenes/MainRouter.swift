//
//  MainRouter.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

class MainRouter {

    var eventsRouter: EventsRouter

    init(eventsRouter: EventsRouter) {
        self.eventsRouter = eventsRouter
    }

    var tabBarController: UITabBarController {
        let tabBar = UITabBarController()
        let events = eventsRouter.rootViewController()
        events.tabBarItem = eventsRouter.tabBarItem

        tabBar.viewControllers = [events]
        return tabBar
    }
}

