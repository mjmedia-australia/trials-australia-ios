//
//  DateView.swift
//  Trials Australia
//
//  Created by Matt Langtree on 10/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import UIKit

struct DateViewStyle {

    static var monthTitleAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium),
            NSAttributedString.Key.foregroundColor: BaseColor.white
        ]
    }

    static var singleDateTitleAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.bold),
            NSAttributedString.Key.foregroundColor: BaseColor.white
        ]
    }

    static var multiDateTitleAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium),
            NSAttributedString.Key.foregroundColor: BaseColor.white
        ]
    }
}

class DateView: UIView {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var dateLabel: UILabel!

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
        backgroundView.layer.cornerRadius = 3
        backgroundView.backgroundColor = BaseColor.victorianOrange
    }

    func single(date: Date) {
        let month = NSMutableAttributedString()
        let monthText = DateView.monthFormatter.string(from: date).uppercased()
        month.append(NSAttributedString(string: monthText, attributes: DateViewStyle.monthTitleAttributes))
        monthLabel.attributedText = month

        let dateAttributedString = NSMutableAttributedString()
        let dateText = DateView.dateFormatter.string(from: date)
        dateAttributedString.append(NSAttributedString(string: dateText, attributes: DateViewStyle.singleDateTitleAttributes))
        dateLabel.attributedText = dateAttributedString
    }

    func multi(startDate: Date, endDate: Date) {
        let month = NSMutableAttributedString()
        let monthText = DateView.monthFormatter.string(from: startDate).uppercased()
        month.append(NSAttributedString(string: monthText, attributes: DateViewStyle.monthTitleAttributes))
        monthLabel.attributedText = month

        let date = NSMutableAttributedString()
        let startDateText = DateView.dateFormatter.string(from: startDate)
        let endDateText = DateView.dateFormatter.string(from: endDate)
        let dateText = startDateText + "-" + endDateText
        date.append(NSAttributedString(string: dateText, attributes: DateViewStyle.multiDateTitleAttributes))
        dateLabel.attributedText = date
    }

    /// Date format reference:
    /// https://gist.github.com/romaonthego/5138532
    static var monthFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL"
        return dateFormatter
    }

    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }
}

extension DateView: XibView { }
