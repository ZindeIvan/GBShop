//
//  ReviewsCell.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

final class ReviewsCell: UITableViewCell {

    private(set) lazy var reviewTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    func configure(with text: String) {
        reviewTextLabel.text = text
    }

    override func prepareForReuse() {
        reviewTextLabel.text = nil
    }

    private func configureUI() {

        contentView.addSubview(reviewTextLabel)

        let topSpacing : CGFloat = 5.0
        let leftSpacing : CGFloat = 12.0
        let rightSpacing : CGFloat = -20.0
        NSLayoutConstraint.activate([
            reviewTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSpacing),
            reviewTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leftSpacing),
            reviewTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: rightSpacing)
        ])
    }

}
