//
//  Errors.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 06/09/2022.
//

import Foundation

enum NetworkRequestError: Error {
    case unknown
    case requestError
    case notConnected
    case serverError(error: String)
}
