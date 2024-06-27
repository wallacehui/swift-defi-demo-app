//
//  AppError.swift
//  DefiDemoApp
//
//  Created by Wallace Hui on 28/6/2024.
//

import Foundation

enum AppError: Error {
    case general(Error)
    case fileNotFound
    case decodeFailure
}
