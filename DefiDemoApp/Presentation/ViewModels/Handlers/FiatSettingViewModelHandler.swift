//
//  FiatSettingViewModelHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

final class FiatSettingViewModelHandler: FiatSettingViewModel {
    private var cancellables = Set<AnyCancellable>()
    private let selected = CurrentValueSubject<FiatType, Never>(.hkd)
    private let fiatOptionsSubject = CurrentValueSubject<[FiatOption], Never>([])

    init() {
        fiatOptionsSubject.send(FiatType.allCases.map { FiatOption(fiat: $0, isSelected: false) })
    }
}

extension FiatSettingViewModelHandler: FiatSettingViewModelInput {
    func didSelectIndex(_ index: Int) {
        print("index", index)
    }
}

extension FiatSettingViewModelHandler: FiatSettingViewModelOutput {
    var fiatOptionsPublisher: AnyPublisher<[FiatOption], Never> {
        fiatOptionsSubject.eraseToAnyPublisher()
    }
    
    var fiatOptions: [FiatOption] {
        fiatOptionsSubject.value
    }
}

