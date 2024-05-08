//
//  UserPreferencesServiceTests.swift
//  MercadoLibreTests
//
//  Created by Juan Camilo Marín Ochoa on 8/05/24.
//

import XCTest
@testable import MercadoLibre

final class UserPreferencesServiceTests: XCTestCase {
    var userPreferences: UserPreferencesService!
    var userDefaults: UserDefaults!
    
    override func setUpWithError() throws {
        super.setUp()
        userDefaults = UserDefaults(suiteName: #file)
        userDefaults.removePersistentDomain(forName: #file)
        userPreferences = UserPreferencesService(defaults: userDefaults)
    }
    
    override func tearDownWithError() throws {
        userDefaults.removePersistentDomain(forName: #file)
        super.tearDown()
    }
    
    func testLoadInitialValues() throws {
        userDefaults.set("US", forKey: "country_code")
        userDefaults.set("1", forKey: "country_id")
        userDefaults.set("USD", forKey: "default_currency_id")
        userPreferences = UserPreferencesService(defaults: userDefaults)
        
        XCTAssertEqual(userPreferences.countryCode, "US")
        XCTAssertEqual(userPreferences.countryId, "1")
        XCTAssertEqual(userPreferences.defaultCurrencyId, "USD")
    }
    
    func testUpdateUserDefaults() throws {
        userPreferences.countryCode = "CA"
        userPreferences.countryId = "2"
        userPreferences.defaultCurrencyId = "CAD"
        
        XCTAssertEqual(userDefaults.string(forKey: "country_code"), "CA")
        XCTAssertEqual(userDefaults.string(forKey: "country_id"), "2")
        XCTAssertEqual(userDefaults.string(forKey: "default_currency_id"), "CAD")
    }
    
    func testHandlingNilValues() throws {
        userPreferences.countryCode = nil
        userPreferences.countryId = nil
        userPreferences.defaultCurrencyId = nil
        
        XCTAssertNil(userDefaults.string(forKey: "country_code"))
        XCTAssertNil(userDefaults.string(forKey: "country_id"))
        XCTAssertNil(userDefaults.string(forKey: "default_currency_id"))
    }
}
