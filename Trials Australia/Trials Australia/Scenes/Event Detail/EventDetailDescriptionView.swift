//
//  EventDetailDescriptionView.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

class EventDetailDescriptionView: UIView {

    @IBOutlet weak var label: UILabel!

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

    func configure(attributedText: NSAttributedString) {
        label.attributedText = attributedText
    }
}

extension EventDetailDescriptionView: XibView { }
