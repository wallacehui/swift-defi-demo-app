//
//  FiatSettingViewModelHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

final class FiatSettingViewModelHandler: FiatSettingViewModel {
    private let userDefaultsSerivce: UserDefaultsService

    private var cancellables = Set<AnyCancellable>()
    private let fiatOptionsSubject = CurrentValueSubject<[FiatOption], Never>([])

    init(userDefaultsSerivce: UserDefaultsService = UserDefaultsServiceProvider.shared) {
        self.userDefaultsSerivce = userDefaultsSerivce
        initialOptions()
    }

    private func initialOptions() {
        var selectedFiat: FiatType?
        if let value = userDefaultsSerivce.getString(forKey: .fiatValuation) {
              selectedFiat = FiatType(rawValue: value)
        }
        let options = FiatType.allCases.map { FiatOption(fiat: $0, isSelected: $0 == selectedFiat) }
        fiatOptionsSubject.send(options)
    }
}

extension FiatSettingViewModelHandler: FiatSettingViewModelInput {
    func didSelectIndex(_ index: Int) {
        let option = fiatOptions[index]
        userDefaultsSerivce.saveString(option.fiat.rawValue, forKey: .fiatValuation)
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

