//
//  APICountry_Tests.swift
//  
//
//  Created by Serhii Horinenko on 03.07.2024.
//

import XCTest
@testable import WorldleAPI

final class APICountry_Tests: XCTestCase {

    func test_APICountry_init_doesFullyInitialize() throws {
        // Given
        let code = UUID().uuidString
        let name = UUID().uuidString
        let latitude = Double(Int.random(in: Int.min...Int.max))
        let longitude = Double(Int.random(in: Int.min...Int.max))

        // When
        let result = APICountry(code: code,
                                name: name,
                                latitude: latitude,
                                longitude: longitude)

        // Then
        XCTAssertTrue(result.code == code)
        XCTAssertTrue(result.name == name)
        XCTAssertTrue(result.latitude == latitude)
        XCTAssertTrue(result.longitude == longitude)
    }
    
}
