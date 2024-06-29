//
//  FiatSettingViewModelTest.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine
import XCTest
@testable import DefiDemoApp

final class FiatSettingViewModelTest: XCTestCase {
    private var viewModel: FiatSettingViewModel!
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        cancellables = .init()
        viewModel = FiatSettingViewModelHandler(userDefaultsSerivce: UserDefaultsServiceStub())
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
    }

    func testHkdIsSelected() throws {
        let exp = expectation(description: #function)
        viewModel.fiatOptionsPublisher
            .sink { options in
                XCTAssertEqual(options.count, 2)
                XCTAssertTrue(options.first(where: { $0.fiat == .hkd })?.isSelected ?? false)
                exp.fulfill()
            }
            .store(in: &cancellables)
        waitForExpectations(timeout: 2)
    }

    func testSelectToUsd() throws {
        let exp = expectation(description: #function)
        viewModel.didSelectIndex(1)
        viewModel.fiatOptionsPublisher
            .sink { options in
                XCTAssertEqual(options.count, 2)
                XCTAssertTrue(options.first(where: { $0.fiat == .usd })?.isSelected ?? false)
                exp.fulfill()
            }
            .store(in: &cancellables)
        waitForExpectations(timeout: 2)
    }
}
