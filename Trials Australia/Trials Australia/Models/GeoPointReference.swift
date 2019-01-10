//
//  GeoPointReference.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

struct GeoPointReference {
    let latitude: Decimal
    let longitude: Decimal

    init?(latitudeString: String?, longitudeString: String?) {
        guard let latString = latitudeString,
            let longString = longitudeString,
            let latitude = Decimal(string: latString),
            let longitude = Decimal(string: longString) else {
                return nil
        }
        self.latitude = latitude
        self.longitude = longitude
    }
}
