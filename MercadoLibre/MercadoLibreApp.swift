//
//  MercadoLibreApp.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import SwiftUI

@main
struct MercadoLibreApp: App {
    @AppStorage("country_id") var countryId: String = ""
    @AppStorage("default_currency_id") var defaultCurrencyId: String = ""
    
    var body: some Scene {
        WindowGroup {
            if countryId != "" && defaultCurrencyId != "" {
                HomeView()
            } else {
                SelectSiteView()
            }
        }
    }
}
