//
//  FiatSettingViewController.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import UIKit

class FiatSettingViewController: UIViewController {
    private let viewModel: FiatSettingViewModel

    let names = ["HKD", "USD"]
    let selected = [false, true]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FiatSelectionViewCell.self,
                           forCellReuseIdentifier: "FiatSelectionViewCell")
        tableView.separatorStyle = .singleLine
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
}

extension FiatSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FiatSelectionViewCell",
            for: indexPath) as? FiatSelectionViewCell else {
            return .init()
        }
        cell.update(name: names[indexPath.row], isSelected: selected[indexPath.row])
        return cell
    }
}

extension FiatSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
