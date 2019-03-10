//
//  PDFSearchResultsCell.swift
//  BookReader
//
//  Created by Kishikawa Katsumi on 2017/07/03.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import UIKit

class PDFSearchResultsCell: UITableViewCell {
    var section: String? = nil {
        didSet {
            sectionLabel.text = section
        }
    }
    var page: String? = nil {
        didSet {
            pageNumberLabel.text = page
        }
    }
    var resultText: String? = nil
    var searchText: String? = nil

    @IBOutlet private weak var sectionLabel: UILabel!
    @IBOutlet private weak var pageNumberLabel: UILabel!
    @IBOutlet private weak var resultTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        sectionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        pageNumberLabel.textColor = .gray
        pageNumberLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        resultTextLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let highlightRange = (resultText! as NSString).range(of: searchText!, options: .caseInsensitive)
        let attributedString = NSMutableAttributedString(string: resultText!)
        let boldFont = UIFont.boldSystemFont(ofSize: resultTextLabel.font.pointSize)
        // attributedString.addAttributes([NSFontAttributeName: boldFont], range: highlightRange) // before swift 4.0
        attributedString.addAttributes([.font: boldFont], range: highlightRange) // after swift 4.0
        resultTextLabel.attributedText = attributedString
    }
}
