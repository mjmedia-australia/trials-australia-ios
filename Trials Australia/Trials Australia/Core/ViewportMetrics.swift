//
//  ViewportMetrics.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

class ViewportMetrics {

    enum HorizontalSize {
        case small
        case standard
        case wide
        case veryWide
    }

    enum VerticalSize {
        case veryShort
        case short
        case medium
        case tall
        case veryTall
    }

    static var horizontalSize: HorizontalSize {
        let width = ViewportMetrics.screenWidth
        if width <= 320 {
            return .small
        } else if width <= 375 {
            return .standard
        } else if width <= 414 {
            return .wide
        } else {
            return .veryWide
        }
    }

    static var verticalSize: VerticalSize {
        let height = ViewportMetrics.screenHeight
        if height <= 480 {
            return .veryShort
        } else if height <= 568 {
            return .short
        } else if height <= 667 {
            return .medium
        } else if height <= 812 {
            return .tall
        } else {
            return .veryTall
        }
    }

    static var screenWidth: CGFloat {
        return UIApplication.shared.keyWindow!.frame.size.width
    }

    static var screenHeight: CGFloat {
        return UIApplication.shared.keyWindow!.frame.size.height
    }

    static var pixelWidth: CGFloat {
        return  1 / UIScreen.main.scale
    }
}
