//
//  AppController.swift
//  Trials Australia
//
//  Created by Matt Langtree on 5/12/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import Foundation

class AppController {

    let notificationService = NotificationService()

    init() {
        notificationService.registerForNotifications()
    }

    func receivedRemoteNotification(deviceToken: Data) {
        notificationService.persist(deviceToken)
    }

}
