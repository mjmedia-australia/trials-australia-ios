//
//  EventListResponse.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

struct EventListResponse: Decodable {
    let data: [EventPartial]
    let links: Links
}

struct EventPartial: Decodable {
    let id: Int
    let name: String
    let description: String?
    let startDate, endDate: Date
    let image: String?
    let locationName: String?
    let locationState: String
    let eventOrganiserName: String?
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case startDate = "start_date"
        case endDate = "end_date"
        case image
        case locationName = "location_name"
        case locationState = "location_state"
        case eventOrganiserName = "event_organiser_name"
        case links
    }
}

struct Links: Decodable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }

}
