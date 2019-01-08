//
//  ViewController.swift
//  Trials Australia
//
//  Created by Matt Langtree on 3/11/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        http://trials-api-dev.ap-southeast-2.elasticbeanstalk.com/api/events

        UIApplication.shared.registerForRemoteNotifications()
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let eventsViewController = EventsListViewController()
        present(eventsViewController, animated: true, completion: nil)
    }

}

