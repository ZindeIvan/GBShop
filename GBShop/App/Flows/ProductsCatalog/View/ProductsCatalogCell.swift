//
//  ProductsCatalogCell.swift
//  GBShop
//
//  Created by Зинде Иван on 3/17/21.
//

import UIKit

final class ProductsCatalogCell: UITableViewCell {

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    func configure(with product: Product) {
        productLabel.text = product.product
        priceLabel.text = "$ \(product.price)"
    }

    override func prepareForReuse() {
        [productLabel, priceLabel].forEach { $0.text = nil }
    }

    private func configureUI() {

        contentView.addSubview(self.productLabel)
        contentView.addSubview(self.priceLabel)

        let topSpacing : CGFloat = 5.0
        let leftSpacing : CGFloat = 12.0
        let rightSpacing : CGFloat = -20.0
        NSLayoutConstraint.activate([
            productLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSpacing),
            productLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: leftSpacing),
            productLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: rightSpacing),
            priceLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: topSpacing),
            priceLabel.leftAnchor.constraint(equalTo: productLabel.leftAnchor),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: rightSpacing)
        ])
    }

}
