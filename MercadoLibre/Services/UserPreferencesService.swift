//
//  UserPreferencesService.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 5/05/24.
//

import Foundation
import Combine

class UserPreferencesService: ObservableObject {
    static let shared = UserPreferencesService()
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        loadInitialValues()
    }
    
    private func loadInitialValues() {
        let loadedCountryCode = defaults.string(forKey: Keys.countryCode)
        let loadedCountryId = defaults.string(forKey: Keys.countryId)
        let loadedDefaultCurrencyId = defaults.string(forKey: Keys.defaultCurrencyId)
        
        print("Initial countryCode: \(loadedCountryCode ?? "N/A")")
        print("Initial countryId: \(loadedCountryId ?? "N/A")")
        print("Initial defaultCurrencyId: \(loadedDefaultCurrencyId ?? "N/A")")
        
        countryCode = loadedCountryCode
        countryId = loadedCountryId
        defaultCurrencyId = loadedDefaultCurrencyId
    }
    
    private enum Keys {
        static let countryCode = "country_code"
        static let countryId = "country_id"
        static let defaultCurrencyId = "default_currency_id"
    }
    
    @Published var countryCode: String? {
        didSet {
            updateUserDefaults(forKey: Keys.countryCode, value: countryCode)
        }
    }
    
    @Published var countryId: String? {
        didSet {
            updateUserDefaults(forKey: Keys.countryId, value: countryId)
        }
    }
    
    @Published var defaultCurrencyId: String? {
        didSet {
            updateUserDefaults(forKey: Keys.defaultCurrencyId, value: defaultCurrencyId)
        }
    }
    
    private func updateUserDefaults(forKey key: String, value: String?) {
        if let value = value {
            defaults.set(value, forKey: key)
        } else {
            defaults.removeObject(forKey: key)
        }
    }
}
