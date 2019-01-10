//
//  EventListTableViewCell.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

class EventListTableViewCell: UITableViewCell {

    @IBOutlet weak var dateView: DateView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with viewModel: EventPartialViewModel) {
        titleLabel?.attributedText = viewModel.nameAndLocationAttributedString
        accessibilityLabel = viewModel.name
        if viewModel.isMultiday {
            dateView.multi(startDate: viewModel.startDate, endDate: viewModel.endDate)
        } else {
            dateView.single(date: viewModel.startDate)
        }
    }
}
