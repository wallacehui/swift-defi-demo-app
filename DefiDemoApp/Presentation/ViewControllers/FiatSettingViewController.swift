//
//  FiatSettingViewController.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine
import SnapKit
import UIKit

class FiatSettingViewController: UIViewController {
    private let viewModel: FiatSettingViewModel
    private var cancellables = Set<AnyCancellable>()

    let names = ["HKD", "USD"]
    let selected = [false, true]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FiatSelectionViewCell.self,
                           forCellReuseIdentifier: "FiatSelectionViewCell")
        return tableView
    }()

    init(viewModel: FiatSettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationBar()
        setupBinding()
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }

    private func setupNavigationBar() {
        navigationItem.title = "Settings"
    }

    private func setupBinding() {
        viewModel.fiatOptionsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension FiatSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fiatOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FiatSelectionViewCell",
            for: indexPath) as? FiatSelectionViewCell else {
            return .init()
        }
        let option = viewModel.fiatOptions[indexPath.row]
        cell.update(name: option.fiat.displayName,
                    isSelected: option.isSelected)
        return cell
    }
}

extension FiatSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectIndex(indexPath.row)
    }
}
