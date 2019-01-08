//
//  UserDefaults+Trials.swift
//  Trials Australia
//
//  Created by Matt Langtree on 5/12/18.
//  Copyright © 2018 Matt Langtree. All rights reserved.
//

import Foundation

extension UserDefaults {

    class var deviceToken: String? {
        get {
            return self.standard.string(forKey: "deviceToken")
        }
        set(value) {
            self.standard.set(value, forKey: "deviceToken")
        }
    }
}
