//
//  EventDetailViewModel.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

protocol EventDetailViewModelProtocol {
    var id: String { get }
    var name: String { get }
    var state: EventState { get }
    var dateAttributedText: NSAttributedString { get }
    var shortLocationName: String { get }
    var imageURL: URL? { get }
    var description: String? { get }

    var locationName: String? { get }
    var address: String? { get }
    var drivingDirections: String? { get }
    var geoPointReference: GeoPointReference? { get }

    var organiserName: String? { get }
    var organiserDescription: String? { get }
    var organiserWebsite: URL? { get }
    var organiserFacebook: URL? { get }
    var organiserInstagram: URL? { get }
    var organiserYoutube: URL? { get }
    var organiserTwitter: URL? { get }

    var eventContacts: [EventContact] { get }
}

class EventDetailViewModel: EventDetailViewModelProtocol {


    var id: String {
        return String(model.id)
    }

    var name: String {
        return model.name
    }

    var state: EventState {
        return EventState(rawValue: model.location.state) ?? EventState.nonAustralianState
    }

    var dateAttributedText: NSAttributedString {
        return NSAttributedString(string: "Date goes here...", attributes: nil)
    }

    var shortLocationName: String {
        return model.location.name + ", " + model.location.state
    }

    var imageURL: URL? {
        guard let imageURL = model.image else { return nil }
        return URL(string: imageURL)
    }

    var description: String? {
        return model.description
    }

    var locationName: String? {
        return model.location.name
    }

    var address: String? {
        let components = [
            model.location.address,
            model.location.city,
            model.location.postalCode,
            model.location.state,
            model.location.country
        ]
        return components.compactMap { $0 }.joined(separator: ", ")
    }

    var drivingDirections: String? {
        return model.location.directionsDescription
    }

    var geoPointReference: GeoPointReference? {
        return GeoPointReference(latitudeString: model.location.latitude, longitudeString: model.location.longitude)
    }

    var organiserName: String? {
        guard let organiser = model.eventOrganiser else { return nil }
        return organiser.name
    }

    var organiserDescription: String? {
        return model.eventOrganiser?.eventDescription
    }

    var organiserWebsite: URL? {
        guard let urlString = model.eventOrganiser?.websiteURL else { return nil }
        return URL(string: urlString)
    }

    var organiserFacebook: URL? {
        guard let urlString = model.eventOrganiser?.facebookURL else { return nil }
        return URL(string: urlString)
    }

    var organiserInstagram: URL? {
        guard let urlString = model.eventOrganiser?.instagramURL else { return nil }
        return URL(string: urlString)
    }

    var organiserYoutube: URL? {
        guard let urlString = model.eventOrganiser?.youtubeURL else { return nil }
        return URL(string: urlString)
    }

    var organiserTwitter: URL? {
        guard let urlString = model.eventOrganiser?.twitterURL else { return nil }
        return URL(string: urlString)
    }

    var eventContacts: [EventContact] {
        return model.eventContacts ?? []
    }

    let model: EventDetail

    init(event: EventDetail) {
        self.model = event
    }

}
