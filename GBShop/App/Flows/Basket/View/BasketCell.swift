//
//  BasketCell.swift
//  GBShop
//
//  Created by Зинде Иван on 3/25/21.
//

import UIKit

final class BasketCell: UITableViewCell {

    private var cellIndex : Int?

    weak var delegate : BasketCellDelegate?

    private(set) lazy var productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()

    private(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()

    private(set) lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()

    private(set) var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash.circle"), for: .normal)
        button.setImage(UIImage(systemName: "trash.circle.fill"), for: .selected)
        button.layer.masksToBounds = true
        return button
    }()

    private(set) var countStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.wraps = false
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.value = 0
        return stepper
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    func configure(with item: BasketItem, index: Int) {
        cellIndex = index
        countStepper.value = Double(item.count)
        productLabel.text = item.product
        priceLabel.text = String(format: "%.2f", item.price) + " руб."
        countLabel.text = "\(String(format: "%.0f", countStepper.value)) шт."
    }

    override func prepareForReuse() {
        productLabel.text = nil
        priceLabel.text = nil
        countLabel.text = nil
        countStepper.value = 0
    }

    private func configureUI() {

        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(countStepper)
        contentView.addSubview(deleteButton)

        deleteButton.addTarget(self,action: #selector(deleteButtonAction), for: .touchUpInside)
        countStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        let topSpacing : CGFloat = 5.0
        let leftSpacing : CGFloat = 12.0
        let rightSpacing : CGFloat = -20.0
        let buttonRadius : CGFloat = 30.0
        let cellHeigh : CGFloat = 100.0
        let priceWidth : CGFloat = 100.0
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: cellHeigh),
            productLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSpacing),
            productLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftSpacing),
            productLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: rightSpacing),
            priceLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: topSpacing),
            priceLabel.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: priceWidth),
            deleteButton.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: topSpacing),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -leftSpacing),
            deleteButton.heightAnchor.constraint(equalToConstant: buttonRadius),
            deleteButton.widthAnchor.constraint(equalToConstant: buttonRadius),
            countLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: topSpacing),
            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftSpacing),
            countLabel.widthAnchor.constraint(equalToConstant: priceWidth),
            countStepper.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: topSpacing),
            countStepper.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: leftSpacing)
        ])
    }

    @objc func stepperValueChanged(sender:UIStepper!) {
        guard let index = cellIndex else { return }
        let value = Int(sender.value)
        countLabel.text = "\(String(format: "%.0f", sender.value)) шт."
        delegate?.countValueChanged(index: index, count: value)
    }

    @objc func deleteButtonAction(sender: UIButton!) {
        guard let index = cellIndex else { return }
        delegate?.deleteButtonTapped(index: index)
    }

}
