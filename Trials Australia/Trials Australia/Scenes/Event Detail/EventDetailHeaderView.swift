//
//  EventDetailHeaderView.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

class EventDetailHeaderView: UIView {

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    private func configure() {
        setupXib()
    }

    func configure(name: NSAttributedString, date: NSAttributedString, locationName: NSAttributedString) {
        eventNameLabel.attributedText = name
        dateLabel.attributedText = date
        locationNameLabel.attributedText = locationName
    }
}

extension EventDetailHeaderView: XibView { }
