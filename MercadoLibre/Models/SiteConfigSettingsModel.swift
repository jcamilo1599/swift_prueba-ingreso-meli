//
//  SiteConfigSettingsModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 5/05/24.
//

import Foundation

struct SiteConfigSettingsModel: Codable {
    let identificationTypes: [String]
    
    enum CodingKeys: String, CodingKey {
        case identificationTypes = "identification_types"
    }
}
