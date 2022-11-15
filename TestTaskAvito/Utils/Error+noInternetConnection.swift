//
//  Error+noInternetConnection.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 12.11.2022.
//

import Foundation

extension Error {
    var isNoInternetConnectionError: Bool {
        switch (self as NSError).code {
        case URLError.Code.notConnectedToInternet.rawValue,
            URLError.Code.networkConnectionLost.rawValue:
            return true
        default:
            return false
        }
    }
}
