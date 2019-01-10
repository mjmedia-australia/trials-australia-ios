//
//  EventDetailResponse.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

struct EventDetailResponse: Codable {
    let data: EventDetail
    let links: Links
}

struct EventDetail: Codable {
    let id: Int
    let name: String
    let image: String?
    let description: String?
    let startDate: Date
    let endDate: Date
    let location: Location
    let eventOrganiser: EventOrganiser?
    let eventContacts: [EventContact]?

    enum CodingKeys: String, CodingKey {
        case id, name, image, description
        case startDate = "start_date"
        case endDate = "end_date"
        case location
        case eventOrganiser = "event_organiser"
        case eventContacts = "event_contacts"
    }
}

struct EventContact: Codable {
    let contactName: String
    let email: String?
    let phone: String?
    let role: String

    enum CodingKeys: String, CodingKey {
        case contactName = "contact_name"
        case email, phone, role
    }
}

struct EventOrganiser: Codable {
    let id: Int
    let name: String
    let slug: String?
    let state: String
    let clubListDescription: String
    let eventDescription: String?
    let websiteURL: String?
    let facebookURL: String?
    let instagramURL: String?
    let youtubeURL: String?
    let twitterURL: String?
    let createdAt: Date?
    let updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, state
        case clubListDescription = "club_list_description"
        case eventDescription = "event_description"
        case websiteURL = "website_url"
        case facebookURL = "facebook_url"
        case instagramURL = "instagram_url"
        case youtubeURL = "youtube_url"
        case twitterURL = "twitter_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct Location: Codable {
    let id: Int
    let name: String
    let address: String?
    let city: String?
    let state: String
    let postalCode: String?
    let country: String?
    let directionsDescription: String?
    let latitude: String?
    let longitude: String?
    let createdAt: Date?
    let updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case id, name, address, city, state
        case postalCode = "postal_code"
        case country
        case directionsDescription = "directions_description"
        case latitude, longitude
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

}
