//
//  UserDefaultsServiceProvider.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation

enum UserDefaultsKey: String {
    case fiatValuation = "user_default_fiat_valuation_preference"
}

class UserDefaultsServiceProvider: UserDefaultsService {
    static let shared = UserDefaultsServiceProvider()

    private let defaults = UserDefaults.standard

    private init() {}

    func saveString(_ value: String, forKey key: UserDefaultsKey) {
        defaults.set(value, forKey: key.rawValue)
    }

    func getString(forKey key: UserDefaultsKey) -> String? {
        return defaults.string(forKey: key.rawValue)
    }
}
