//
//  FiatSettingViewModel.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

protocol FiatSettingViewModelOutput {
    var fiatOptionsPublisher: AnyPublisher<[FiatOption], Never> { get }
    var fiatOptions: [FiatOption] { get }
}

protocol FiatSettingViewModelInput {
    func didSelectIndex(_ index: Int)
}

protocol FiatSettingViewModel: FiatSettingViewModelInput,
                               FiatSettingViewModelOutput {}
