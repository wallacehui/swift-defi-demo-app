//
//  PortfolioViewController.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Combine
import SnapKit
import UIKit

class PortfolioViewController: UIViewController {
    private let viewModel: PortfolioViewModel
    private var cancellables = Set<AnyCancellable>()

    private lazy var totalBalanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "214214HKD"
        return label
    }()

    private lazy var totalBalanceHeaderView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.text = "Total Balance"
        let view = UIStackView(arrangedSubviews: [
            titleLabel,
            totalBalanceLabel
        ])
        view.axis = .vertical
        view.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0
        tableView.register(AssetListTableViewCell.self, forCellReuseIdentifier: "AssetListTableViewCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()

    init(viewModel: PortfolioViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupViews()
        setupBinding()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.initialiseData()
    }

    private func setupViews() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }

    private func setupNavigationBar() {
        navigationItem.title = "Portfolio"
        navigationItem.rightBarButtonItem = .init(title: "Setting",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(didTapSetting))
    }

    private func setupBinding() {
        viewModel.assetListPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
        viewModel.totalBalancePublisher
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] totalBalance in
                guard let self = self else { return }
                totalBalanceLabel.text = totalBalance
            }
            .store(in: &cancellables)
    }

    @objc
    private func didTapSetting() {
        let vc = FiatSettingViewControllerFactory.makeFiatSettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.assetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AssetListTableViewCell",
                                                       for: indexPath) as? AssetListTableViewCell else {
            return .init()
        }
        let model = viewModel.assetList[indexPath.row]
        cell.update(name: model.cryptoName.capitalized,
                    amount: "\(model.cryptoAmount) \(model.cryptoSymbol)",
                    valuation: model.fiatRate?.formatted(.currency(code: model.fiatSymbol ?? "")))
        return cell
    }
}

extension PortfolioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return totalBalanceHeaderView
    }
}
