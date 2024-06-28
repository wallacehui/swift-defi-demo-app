//
//  AssetListTableViewCell.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import SnapKit
import UIKit

class AssetListTableViewCell: UITableViewCell {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "ETH"
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "0.43435 ETH"
        label.textAlignment = .right
        return label
    }()

    private lazy var valuationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "HKD243235"
        label.textAlignment = .right
        return label
    }()

    private lazy var rightContainer: UIStackView = {
        let rightContainer = UIStackView(arrangedSubviews: [
            amountLabel,
            valuationLabel
        ])
        rightContainer.axis = .vertical
        return rightContainer
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none

        let container = UIStackView(arrangedSubviews: [
            nameLabel,
            rightContainer
        ])
        container.alignment = .center
        container.spacing = 4

        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(12)
        }
    }

    func update(name: String?, amount: String?, valuation: String?) {
        nameLabel.text = name
        amountLabel.text = amount
        valuationLabel.text = valuation
    }
}
