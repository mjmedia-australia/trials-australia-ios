//
//  EventsStyle.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

struct EventsList {

    static var eventNameAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }

    static var subtitleAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline),
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]
    }

    static var stateAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1),
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]
    }
}
