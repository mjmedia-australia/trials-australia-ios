//
//  EventState.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

enum EventState: String {
    case victoria
    case queensland
    case newSouthWales
    case act
    case tasmania
    case westernAustralia
    case southAustralia
    case northernTerritory
    case nonAustralianState

    public init?(rawValue: String) {
        switch rawValue {
        case "VIC":
            self = .victoria
        case "QLD":
            self = .queensland
        case "NSW":
            self = .newSouthWales
        case "ACT":
            self = .act
        case "TAS":
            self = .tasmania
        case "WA":
            self = .westernAustralia
        case "SA":
            self = .southAustralia
        case "NT":
            self = .northernTerritory
        default:
            self = .nonAustralianState
        }
    }
}
