//
//  FiatSettingViewController.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import UIKit

class FiatSettingViewController: UIViewController {
    private let viewModel: FiatSettingViewModel

    init(viewModel: FiatSettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
