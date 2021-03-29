//
//  ReviewsCell.swift
//  GBShop
//
//  Created by Зинде Иван on 3/22/21.
//

import UIKit

final class ReviewsCell: UITableViewCell {

    private var cellIndex : Int?

    weak var delegate : ReviewsCellDelegate?

    private(set) lazy var reviewTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        return label
    }()

    private(set) var approveButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
        button.layer.cornerRadius = 10.0
        button.layer.masksToBounds = true
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    func configure(with text: String, index: Int) {
        reviewTextLabel.text = text
        cellIndex = index
    }

    override func prepareForReuse() {
        reviewTextLabel.text = nil
    }

    private func configureUI() {

        contentView.addSubview(reviewTextLabel)
        contentView.addSubview(approveButton)

        approveButton.addTarget(self,action: #selector(approveButtonAction), for: .touchUpInside)
        let topSpacing : CGFloat = 5.0
        let leftSpacing : CGFloat = 12.0
        let rightSpacing : CGFloat = -20.0
        let likeButtonRadius : CGFloat = 30.0
        let cellHeigh : CGFloat = 80.0
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: cellHeigh),
            reviewTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSpacing),
            reviewTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leftSpacing),
            reviewTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: rightSpacing),
            approveButton.topAnchor.constraint(equalTo: reviewTextLabel.bottomAnchor, constant: topSpacing),
            approveButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leftSpacing),
            approveButton.widthAnchor.constraint(equalToConstant: likeButtonRadius),
            approveButton.heightAnchor.constraint(equalToConstant: likeButtonRadius)
        ])
    }

    @objc func approveButtonAction(sender: UIButton!) {
        guard let index = cellIndex else { return }
        approveButton.isSelected = !approveButton.isSelected
        delegate?.approveButtonTapped(index: index)
    }

}
