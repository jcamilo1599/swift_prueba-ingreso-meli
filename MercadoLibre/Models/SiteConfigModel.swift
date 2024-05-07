//
//  SiteConfigModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 5/05/24.
//

import Foundation

struct SiteConfigModel: Codable, Identifiable {
    let id, name, countryID, saleFeesMode: String
    let mercadopagoVersion: Int?
    let defaultCurrencyID, immediatePayment: String
    let paymentMethodIDS: [String]
    let settings: SiteConfigSettingsModel
    let currencies: [CurrencyModel]
    let categories: [CategoryModel]
    let channels: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case countryID = "country_id"
        case saleFeesMode = "sale_fees_mode"
        case mercadopagoVersion = "mercadopago_version"
        case defaultCurrencyID = "default_currency_id"
        case immediatePayment = "immediate_payment"
        case paymentMethodIDS = "payment_method_ids"
        case settings, currencies, categories, channels
    }
}
