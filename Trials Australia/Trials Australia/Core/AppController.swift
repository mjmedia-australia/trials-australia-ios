//
//  AppController.swift
//  Trials Australia
//
//  Created by Matt Langtree on 5/12/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import UIKit

class AppController {

    let notificationService = NotificationService()

    let mainRouter: MainRouter

    let window: UIWindow

    init() {
        notificationService.registerForNotifications()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let events = EventsRouter()
        let main = MainRouter(eventsRouter: events)
        self.mainRouter = main
    }

    func setupWindow() -> UIWindow {
        window.rootViewController = mainRouter.tabBarController
        window.makeKeyAndVisible()
        return window
    }

    func receivedRemoteNotification(deviceToken: Data) {
        notificationService.persist(deviceToken)
    }

}
