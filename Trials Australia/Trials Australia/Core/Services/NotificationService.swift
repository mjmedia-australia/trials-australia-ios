//
//  NotificationService.swift
//  Trials Australia
//
//  Created by Matt Langtree on 5/12/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationService: NSObject {

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self

    }

    func registerForNotifications() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            self.registerForRemoteNotifications()
        }
    }

    func registerForRemoteNotifications() {
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    }

    func persist(_ deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        // a96a51774c44c618bf66afeeab390f6d2cab3359a4d5d2e82d0c5a67478b421e
        UserDefaults.deviceToken = token
    }

}

extension NotificationService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

        completionHandler()
    }

}
