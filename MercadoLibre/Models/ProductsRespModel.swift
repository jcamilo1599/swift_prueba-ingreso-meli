//
//  ProductsRespModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import Foundation

struct ProductsRespModel: Codable {
    let siteID, countryDefaultTimeZone: String
    let paging: PagingModel
    let results: [ProductModel]
    let sort: SortModel
    let availableSorts: [SortModel]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case paging, results, sort
        case availableSorts = "available_sorts"
    }
}

