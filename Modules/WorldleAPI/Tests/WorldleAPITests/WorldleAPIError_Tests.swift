//
//  WorldleAPIError_Tests.swift
//  
//
//  Created by Serhii Horinenko on 03.07.2024.
//

import XCTest
@testable import WorldleAPI

final class WorldleAPIError_Tests: XCTestCase {

    func test_WorldleAPIError_init_doesDomainInitialize() throws {
        // Given

        // When
        let result = WorldleAPIError.Domain

        // Then
        XCTAssertTrue(result == "com.worldle.api.error.network")
    }

    func test_WorldleAPIError_init_doesUndefinedInitialize() throws {
        // Given

        // When
        let result = WorldleAPIError.undefined

        // Then
        XCTAssertTrue(result.code == -1)
        XCTAssertTrue(result.localizedDescription == "Undefined error")
    }

    func test_WorldleAPIError_init_doesParsingInitialize() throws {
        // Given

        // When
        let result = WorldleAPIError.parsing

        // Then
        XCTAssertTrue(result.code == -2)
        XCTAssertTrue(result.localizedDescription == "Could not parse data received from the server")
    }

}
