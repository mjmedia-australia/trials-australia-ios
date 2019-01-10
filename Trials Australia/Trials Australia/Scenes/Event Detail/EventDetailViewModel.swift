//
//  EventDetailViewModel.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

// Used only for HTML conversion to NSAttributedString
import UIKit

protocol EventDetailViewModelProtocol {
    var id: String { get }
    var name: String { get }
    var nameAttributed: NSAttributedString { get }
    var state: EventState { get }
    var dateAttributed: NSAttributedString { get }
    var locationAttributed: NSAttributedString { get }
    var imageURL: URL? { get }
    var description: NSAttributedString? { get }

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

    var nameAttributed: NSAttributedString {
        return NSAttributedString(string: name, attributes: EventsStyle.Detail.titleAttributes)
    }

    var state: EventState {
        return EventState(rawValue: model.location.state) ?? EventState.nonAustralianState
    }

    var isMultiday: Bool {
        return model.startDate != model.endDate
    }

    var dateAttributed: NSAttributedString {
        var dateString = EventDetailViewModel.monthFormatter.string(from: model.startDate)
        if isMultiday {
            let endDate = EventDetailViewModel.monthFormatter.string(from: model.endDate)
            dateString.append(contentsOf: " - " + endDate)
        }
        return NSAttributedString(string: dateString, attributes: EventsStyle.Detail.subtitleAttributes)
    }

    var locationAttributed: NSAttributedString {
        let shortLocation = model.location.name + ", " + model.location.state
        return NSAttributedString(string: shortLocation, attributes: EventsStyle.Detail.subtitleAttributes)
    }

    var imageURL: URL? {
        guard let imageURL = model.image else { return nil }
        return URL(string: imageURL)
    }

    var description: NSAttributedString?

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

    //  Returns date in the format: `Sun, 21 Oct 2019`
    /// https://gist.github.com/romaonthego/5138532
    static var monthFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy"
        return dateFormatter
    }


    let model: EventDetail

    init(event: EventDetail) {
        self.model = event

        self.description = model.description?.convertHtml()
    }

}

extension String{
    func convertHtml() -> NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do{
            let attributedString = try NSMutableAttributedString(data: data, options:
                [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
            attributedString.setAttributes(EventsStyle.Detail.bodyAttributes, range: NSRange(location: 0, length: attributedString.length))

            return attributedString
        }catch{
            return nil
        }
    }
}
