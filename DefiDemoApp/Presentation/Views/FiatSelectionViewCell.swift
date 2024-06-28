//
//  FiatSelectionViewCell.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import UIKit

class FiatSelectionViewCell: UITableViewCell {
    private lazy var checkImageView: UIImageView = {
        let view = UIImageView(image: .checkmark)
        view.isHidden = true
        view.snp.makeConstraints { make in
            make.width.height.equalTo(18)
        }
        return view
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "USD"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let container = UIStackView(arrangedSubviews: [
            nameLabel,
            checkImageView
        ])
        container.spacing = 4
        container.alignment = .center

        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(12)
        }
    }

    func update(name: String?, isSelected: Bool) {
        nameLabel.text = name
        checkImageView.isHidden = !isSelected
    }
}
