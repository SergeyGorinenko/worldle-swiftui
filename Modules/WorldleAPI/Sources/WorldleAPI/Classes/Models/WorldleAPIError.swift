//
//  WorldleAPIError.swift
//  
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import Foundation

// MARK: - WorldleAPIError

public enum WorldleAPIError: Error {

    case undefined
    case parsing

    public static let Domain = "com.worldle.api.error.network"

    fileprivate enum Code: Int {
        case undefined = -1
        case parsing = -2
    }

    public var code: Int {
        switch self {
        case .undefined:
            return Code.undefined.rawValue
        case .parsing:
            return Code.parsing.rawValue
        }
    }

    public var localizedDescription: String {
        switch self {
        case .undefined:
            return "Undefined error"
        case .parsing:
            return "Could not parse data received from the server"
        }
    }

}
