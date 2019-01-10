//
//  AppDelegate.swift
//  Trials Australia
//
//  Created by Matt Langtree on 3/11/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appController: AppController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        appController = AppController()
        self.window = appController.setupWindow()

        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appController.receivedRemoteNotification(deviceToken: deviceToken)
    }

}

