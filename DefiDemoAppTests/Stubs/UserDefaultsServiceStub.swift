//
//  UserDefaultsServiceStub.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation
@testable import DefiDemoApp

class UserDefaultsServiceStub: UserDefaultsService {
    var fiatPreference = FiatType.hkd.rawValue

    func saveString(_ value: String?, forKey key: DefiDemoApp.UserDefaultsKey) {
        // do nothing
    }
    
    func getString(forKey key: DefiDemoApp.UserDefaultsKey) -> String? {
        return fiatPreference
    }
}
