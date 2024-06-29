//
//  UserDefaultsService.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 29/6/2024.
//

import Foundation

protocol UserDefaultsService {
    func saveString(_ value: String?, forKey key: UserDefaultsKey)
    func getString(forKey key: UserDefaultsKey) -> String?
}
