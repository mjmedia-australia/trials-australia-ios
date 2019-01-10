//
//  EventsStyle.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

struct EventsStyle {

    static var eventNameAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
            NSAttributedString.Key.foregroundColor: BaseColor.black
        ]
    }

    static var subtitleAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline),
            NSAttributedString.Key.foregroundColor: BaseColor.lightGrey
        ]
    }

    static var stateAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1),
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]
    }

    struct Detail {

        static var titleAttributes: [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1),
                NSAttributedString.Key.foregroundColor: BaseColor.black
            ]
        }

        static var subtitleAttributes: [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body),
                NSAttributedString.Key.foregroundColor: BaseColor.darkText
            ]
        }

        static var bodyAttributes: [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body),
                NSAttributedString.Key.foregroundColor: BaseColor.black
            ]
        }

        struct ImageView {
            static var backgroundColor: UIColor = BaseColor.lightGrey
        }

    }

    struct Navigation {
        static var backgroundColor: UIColor = BaseColor.victorianOrange
        static var tintColor: UIColor = BaseColor.white

        static var titleAttributes: [NSAttributedString.Key: Any] {
            return [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold),
                NSAttributedString.Key.foregroundColor: BaseColor.white
            ]
        }
    }
}
