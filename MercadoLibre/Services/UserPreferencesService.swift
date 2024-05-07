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
        
        countryCode = defaults.string(forKey: Keys.countryCode)
        countryId = defaults.string(forKey: Keys.countryId)
        defaultCurrencyId = defaults.string(forKey: Keys.defaultCurrencyId)
    }

    private enum Keys {
        static let countryCode = "country_code"
        static let countryId = "country_id"
        static let defaultCurrencyId = "default_currency_id"
    }
    
    @Published var countryCode: String? {
        didSet {
            defaults.set(countryCode, forKey: Keys.countryCode)
        }
    }
    
    @Published var countryId: String? {
        didSet {
            defaults.set(countryId, forKey: Keys.countryId)
        }
    }
    
    @Published var defaultCurrencyId: String? {
        didSet {
            defaults.set(defaultCurrencyId, forKey: Keys.defaultCurrencyId)
        }
    }
}
