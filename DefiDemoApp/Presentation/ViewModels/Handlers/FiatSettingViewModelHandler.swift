//
//  FiatSettingViewModelHandler.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine

final class FiatSettingViewModelHandler: FiatSettingViewModel {
    private let userDefaultsService: UserDefaultsService

    private var cancellables = Set<AnyCancellable>()
    private let fiatOptionsSubject = CurrentValueSubject<[FiatOption], Never>([])
    private let selected = CurrentValueSubject<FiatType?, Never>(nil)

    init(userDefaultsSerivce: UserDefaultsService = UserDefaultsServiceProvider.shared) {
        self.userDefaultsService = userDefaultsSerivce
        setupBinding()
        initialOptions()
    }

    private func setupBinding() {
        selected
            .removeDuplicates()
            .sink { [weak self] selectedFiat in
                guard let self = self else { return }
                let options = FiatType.allCases.map { FiatOption(fiat: $0, isSelected: $0 == selectedFiat) }
                fiatOptionsSubject.send(options)
            }
            .store(in: &cancellables)
    }

    private func initialOptions() {
        var selectedFiat: FiatType?
        if let value = userDefaultsService.getString(forKey: .fiatValuation) {
              selectedFiat = FiatType(rawValue: value)
        }
        selected.send(selectedFiat)
    }
}

extension FiatSettingViewModelHandler: FiatSettingViewModelInput {
    func didSelectIndex(_ index: Int) {
        let option = fiatOptions[index]
        selected.send(option.fiat)
        userDefaultsService.saveString(option.fiat.rawValue, forKey: .fiatValuation)
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

