//
//  UserDefaultsServiceTest.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import XCTest
@testable import DefiDemoApp

final class UserDefaultsServiceTest: XCTestCase {
    private var service: UserDefaultsService!

    override func setUpWithError() throws {
        service = UserDefaultsServiceProvider.shared
    }

    override func tearDownWithError() throws {
        service = nil
    }

    func testSaveFiatPreferenceSuccess() {
        service.saveString("hkd", forKey: .fiatValuation)
        let stored = service.getString(forKey: .fiatValuation)
        XCTAssertEqual(stored, "hkd")
    }
}
