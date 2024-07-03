import XCTest
@testable import WorldleAPI

final class GetCountriesAPI_Tests: XCTestCase {
    
    private var responseData: [APICountry]?

    func test_GetCountriesAPI_getCountries_doesReturnListOfCountries() throws {
        // Given
        let baseURL = Bundle.module.url(forResource: "countries", withExtension: "json")!.deletingLastPathComponent()
        
        // When
        let expectation = XCTestExpectation()
        
        Task {
            do {
                let response = try await GetCountriesAPI.getCountries(baseURL: baseURL)
                await MainActor.run { [weak self] in
                    self?.responseData = response
                    expectation.fulfill()
                }
            } catch {
                XCTFail("Could not get countries data!")
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 3)
        XCTAssertNotNil(responseData, "Response data must not be nil")
        XCTAssertTrue(responseData?.count ?? 0 > 0, "The number of countries must be greater than zero!")
    }

    func test_GetCountriesAPI_getCountries_doesThrowError() throws {
        // Given
        let baseURL = Bundle.module.url(forResource: "countries", withExtension: "json")!
        
        // When
        let expectation = XCTestExpectation()
        
        Task {
            do {
                let response = try await GetCountriesAPI.getCountries(baseURL: baseURL)
                await MainActor.run { [weak self] in
                    self?.responseData = response
                    XCTFail("Received countries data!")
                }
            } catch {
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 3)
        XCTAssertNil(responseData, "Response data must be nil")
        XCTAssertTrue(responseData?.count ?? 0 == 0, "The number of countries must be zero!")
    }

    func test_GetCountriesAPI_getCountries_doesReturnEmptyList() throws {
        // Given
        let baseURL = Bundle.module.url(forResource: "countries_empty_list", withExtension: "json")!.deletingLastPathComponent()
        
        // When
        let expectation = XCTestExpectation()
        
        Task {
            do {
                let response = try await GetCountriesAPI.getCountries(baseURL: baseURL, api: "countries_empty_list.json")
                await MainActor.run { [weak self] in
                    self?.responseData = response
                    expectation.fulfill()
                }
            } catch {
                XCTFail("Could not get countries data!")
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 3)
        XCTAssertNotNil(responseData, "Response data must not be nil")
        XCTAssertTrue(responseData?.count ?? 0 == 0, "The number of countries must be zero!")
    }

}
