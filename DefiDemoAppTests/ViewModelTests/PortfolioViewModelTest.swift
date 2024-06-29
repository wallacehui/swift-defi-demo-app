//
//  PortfolioViewModelTest.swift
//  DefiDemoAppTests
//
//  Created by Wallace Hui on 29/6/2024.
//

import Combine
import XCTest
@testable import DefiDemoApp

final class PortfolioViewModelTest: XCTestCase {
    private var viewModel: PortfolioViewModel!
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        cancellables = .init()
        let useCase = AssetUseCaseHandler(cryptoRepository: CryptoRepositoryStub(),
                                          fiatRepository: FiatRepositoryStub())
        viewModel = PortfolioViewModelHandler(useCase: useCase,
                                              userDefaultsService: UserDefaultsServiceStub())
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
    }

    func testAssetsListHasItems() throws {
        let exp = expectation(description: #function)
        viewModel.initialiseData()
        viewModel.assetListPublisher
            .filter { !$0.isEmpty }
            .sink { models in
                XCTAssertEqual(models.count, 5)
                XCTAssertEqual(models.first?.cryptoSymbol, "USDT")
                exp.fulfill()
            }
            .store(in: &cancellables)
        waitForExpectations(timeout: 2)
    }

    func testTotalBalanceInHKD() throws {
        let exp = expectation(description: #function)
        viewModel.initialiseData()
        viewModel.totalBalancePublisher
            .sink { balanceString in
                XCTAssertEqual(balanceString, "HK$61,534.00")
                exp.fulfill()
            }
            .store(in: &cancellables)
        waitForExpectations(timeout: 2)
    }

    func testTotalBalanceInUSD() throws {
        let useCase = AssetUseCaseHandler(cryptoRepository: CryptoRepositoryStub(),
                                          fiatRepository: FiatRepositoryStub())
        let userDefaults = UserDefaultsServiceStub()
        userDefaults.fiatPreference = FiatType.usd.rawValue
        viewModel = PortfolioViewModelHandler(useCase: useCase,
                                              userDefaultsService: userDefaults)
        let exp = expectation(description: #function)
        viewModel.initialiseData()
        viewModel.totalBalancePublisher
            .sink { balanceString in
                XCTAssertEqual(balanceString, "US$68,854.00")
                exp.fulfill()
            }
            .store(in: &cancellables)
        waitForExpectations(timeout: 2)
    }
}
