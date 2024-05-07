//
//  ProductModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

struct ProductModel: Codable {
    let id, title: String
    let condition: String
    let thumbnailID: String
    let catalogProductID: String?
    let listingTypeID: String
    let permalink: String
    let buyingMode: String
    let siteID: String
    let categoryID, domainID: String
    let thumbnail: String
    let currencyID: String
    let orderBackend, price: Int
    let originalPrice: Int?
    let availableQuantity: Int
    let officialStoreID: Int?
    let useThumbnailID, acceptsMercadopago: Bool
    let stopTime: String
    let attributes: [ResultAttributeModel]
    let inventoryID: String?
    let officialStoreName: String?

    enum CodingKeys: String, CodingKey {
        case id, title, condition
        case thumbnailID = "thumbnail_id"
        case catalogProductID = "catalog_product_id"
        case listingTypeID = "listing_type_id"
        case permalink
        case buyingMode = "buying_mode"
        case siteID = "site_id"
        case categoryID = "category_id"
        case domainID = "domain_id"
        case thumbnail
        case currencyID = "currency_id"
        case orderBackend = "order_backend"
        case price
        case originalPrice = "original_price"
        case availableQuantity = "available_quantity"
        case officialStoreID = "official_store_id"
        case useThumbnailID = "use_thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case stopTime = "stop_time"
        case attributes
        case inventoryID = "inventory_id"
        case officialStoreName = "official_store_name"
    }
}
