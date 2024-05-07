//
//  SitesModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import Foundation

struct SitesModel: Codable, Identifiable {
    var defaultCurrencyId, id, name: String
    
    var countryCode: String {
        switch id {
        case "MCU":
            return "CU" // Cuba
        case "MEC":
            return "EC" // Ecuador
        case "MRD":
            return "DO" // República Dominicana
        case "MLB":
            return "BR" // Brasil
        case "MHN":
            return "HN" // Honduras
        case "MGT":
            return "GT" // Guatemala
        case "MLU":
            return "UY" // Uruguay
        case "MLA":
            return "AR" // Argentina
        case "MPY":
            return "PY" // Paraguay
        case "MPE":
            return "PE" // Perú
        case "MLV":
            return "VE" // Venezuela
        case "MPA":
            return "PA" // Panamá
        case "MLC":
            return "CL" // Chile
        case "MBO":
            return "BO" // Bolivia
        case "MLM":
            return "MX" // México
        case "MNI":
            return "NI" // Nicaragua
        case "MCO":
            return "CO" // Colombia
        case "MSV":
            return "SV" // El Salvador
        case "MCR":
            return "CR" // Costa Rica
        default:
            return ""
        }
    }
    
    var flagURL: URL? {
        if let flagcdn = ProcessInfo.processInfo.environment["FLAG_CDN"] {
            return URL(string: "https://\(flagcdn)/h40/\(countryCode.lowercased()).png")
        }
        
        return nil
    }
    
    enum CodingKeys: String, CodingKey {
        case defaultCurrencyId = "default_currency_id"
        case id, name
    }
}
