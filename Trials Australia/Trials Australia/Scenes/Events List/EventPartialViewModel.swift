//
//  EventPartialViewModel.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

struct EventPartialViewModel {
    let id: Int
    let name: String
    let description: String?
    let startDate, endDate: Date
    let image: URL?
    let locationName: String?
    let locationState: String
    let eventOrganiserName: String?

    init(event: EventPartial) {
        self.id = event.id
        self.name = event.name
        self.description = event.description
        self.startDate = event.startDate
        self.endDate = event.endDate
        if let eventImage = event.image {
            self.image = URL(string: eventImage)
        } else {
            self.image = nil
        }
        self.locationName = event.locationName
        self.locationState = event.locationState
        self.eventOrganiserName = event.eventOrganiserName
    }

    var nameAndLocationAttributedString: NSAttributedString {

        let output = NSMutableAttributedString()
        output.append(NSAttributedString(string: name, attributes: EventsStyle.eventNameAttributes))
        if let locationName = locationName {
            output.append(NSAttributedString(string: "\n" + locationName + ", " + locationState, attributes: EventsStyle.subtitleAttributes))
        }

        return output
    }

    var isMultiday: Bool {
        return startDate != endDate
    }

    var dateString: String {
        if isMultiday {
            let start = DateFormatter.eventCellDateFormatter.string(from: startDate)
            let end = DateFormatter.eventCellDateFormatter.string(from: endDate)
            return "\(start) - \(end)"
        } else {
            return DateFormatter.eventCellDateFormatter.string(from: startDate)
        }
    }
}

private extension DateFormatter {
    static var eventCellDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()

}
