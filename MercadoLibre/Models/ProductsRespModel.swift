//
//  ProductsRespModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productsResp = try? JSONDecoder().decode(ProductsResp.self, from: jsonData)

import Foundation

// MARK: - ProductsResp
struct ProductsRespModel: Codable {
    let siteID: String
    let countryDefaultTimeZone: String
    let query: String?
    let paging: ProductsPaging
    let results: [ProductModel]
    let sort: ProductsSort
    let availableSorts: [ProductsSort]
    let filters: [ProductsFilter]
    let availableFilters: [ProductsAvailableFilter]
    let pdpTracking: ProductsPDPTracking?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
        case pdpTracking = "pdp_tracking"
    }
}

// MARK: - ProductsAvailableFilter
struct ProductsAvailableFilter: Codable {
    let id, name: String
    let type: String
    let values: [ProductsAvailableFilterValue]
}

// MARK: - ProductsAvailableFilterValue
struct ProductsAvailableFilterValue: Codable {
    let id, name: String
    let results: Int
}

// MARK: - ProductsSort
struct ProductsSort: Codable {
    let id, name: String?
}

// MARK: - ProductsFilter
struct ProductsFilter: Codable {
    let id, name: String
    let type: String
    let values: [ProductsFilterValue]
}

// MARK: - ProductsFilterValue
struct ProductsFilterValue: Codable {
    let id, name: String
    let pathFromRoot: [ProductsSort]

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
}

// MARK: - ProductsPaging
struct ProductsPaging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

// MARK: - ProductsPDPTracking
struct ProductsPDPTracking: Codable {
    let group: Bool
    let productInfo: [ProductsProductInfo]

    enum CodingKeys: String, CodingKey {
        case group
        case productInfo = "product_info"
    }
}

// MARK: - ProductsProductInfo
struct ProductsProductInfo: Codable {
    let id: String
    let score: Int
    let status: String
}

// MARK: - ProductModel
struct ProductModel: Codable {
    let id, title: String
    let condition: String?
    let thumbnailID: String
    let catalogProductID: String?
    let listingTypeID: String
    let permalink: String
    let buyingMode: String
    let siteID: String
    let categoryID, domainID: String
    let thumbnail: String
    let currencyID: String?
    let orderBackend: Int
    let price, originalPrice: Double?
    let salePrice: JSONNull?
    let availableQuantity: Int
    let officialStoreID: Int?
    let useThumbnailID, acceptsMercadopago: Bool
    let shipping: ProductsShipping
    let stopTime: String
    let seller: ProductsSeller
    let attributes: [ProductsResultAttribute]
    let installments: ProductsInstallments?
    let winnerItemID: JSONNull?
    let catalogListing: Bool
    let discounts: JSONNull?
    let promotions: [JSONAny]?
    let inventoryID: String?
    let location: ProductsLocation?
    let sellerContact: ProductsSellerContact?
    let variationFilters: [String]?
    let variationsData: [String: ProductsVariationsDatum]?
    let officialStoreName: String?
    let differentialPricing: ProductsDifferentialPricing?

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
        case salePrice = "sale_price"
        case availableQuantity = "available_quantity"
        case officialStoreID = "official_store_id"
        case useThumbnailID = "use_thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case shipping
        case stopTime = "stop_time"
        case seller, attributes, installments
        case winnerItemID = "winner_item_id"
        case catalogListing = "catalog_listing"
        case discounts, promotions
        case inventoryID = "inventory_id"
        case location
        case sellerContact = "seller_contact"
        case variationFilters = "variation_filters"
        case variationsData = "variations_data"
        case officialStoreName = "official_store_name"
        case differentialPricing = "differential_pricing"
    }
}

// MARK: - ProductsResultAttribute
struct ProductsResultAttribute: Codable {
    let id: String
    let name: String
    let valueID, valueName: String?
    let attributeGroupID: String
    let attributeGroupName: String
    let valueStruct: ProductsStruct?
    let values: [ProductsAttributeValue]
    let source: Double?
    let valueType: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case valueStruct = "value_struct"
        case values, source
        case valueType = "value_type"
    }
}

// MARK: - ProductsStruct
struct ProductsStruct: Codable {
    let number: Double
    let unit: String
}

// MARK: - ProductsAttributeValue
struct ProductsAttributeValue: Codable {
    let id, name: String?
    let valueStruct: ProductsStruct?
    let source: Double?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "struct"
        case source
    }
}

// MARK: - ProductsDifferentialPricing
struct ProductsDifferentialPricing: Codable {
    let id: Int
}

// MARK: - ProductsInstallments
struct ProductsInstallments: Codable {
    let quantity: Int
    let amount, rate: Double
    let currencyID: String?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}

// MARK: - ProductsLocation
struct ProductsLocation: Codable {
    let addressLine: ProductsAddressLine
    let zipCode: String
    let subneighborhood: JSONNull?
    let neighborhood, city, state, country: ProductsSort
    let latitude, longitude: Double?

    enum CodingKeys: String, CodingKey {
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case subneighborhood, neighborhood, city, state, country, latitude, longitude
    }
}

enum ProductsAddressLine: String, Codable {
    case arraijan62484512 = "Arraijan 62484512"
    case avenidaDOSAutonomistas5334 = "Avenida dos Autonomistas, 5334"
    case brisasDeArreijanSN = "Brisas de arreijan  SN"
    case empty = ""
    case the360791646 = "3 60791646"
}

// MARK: - ProductsSeller
struct ProductsSeller: Codable {
    let id: Int
    let nickname: String
}

// MARK: - ProductsSellerContact
struct ProductsSellerContact: Codable {
    let contact, otherInfo: String
    let webpage: String
    let areaCode, phone, areaCode2, phone2: String
    let email: String

    enum CodingKeys: String, CodingKey {
        case contact
        case otherInfo = "other_info"
        case webpage
        case areaCode = "area_code"
        case phone
        case areaCode2 = "area_code2"
        case phone2, email
    }
}

// MARK: - ProductsShipping
struct ProductsShipping: Codable {
    let storePickUp, freeShipping: Bool
    let logisticType: String?
    let mode: String
    let tags: [String]
    let benefits, promise: JSONNull?

    enum CodingKeys: String, CodingKey {
        case storePickUp = "store_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case mode, tags, benefits, promise
    }
}

// MARK: - ProductsVariationsDatum
struct ProductsVariationsDatum: Codable {
    let thumbnail: String
    let ratio, name: String
    let picturesQty: Int
    let price: Double
    let inventoryID: String?
    let attributes: [ProductsVariationsDatumAttribute]

    enum CodingKeys: String, CodingKey {
        case thumbnail, ratio, name
        case picturesQty = "pictures_qty"
        case price
        case inventoryID = "inventory_id"
        case attributes
    }
}

// MARK: - ProductsVariationsDatumAttribute
struct ProductsVariationsDatumAttribute: Codable {
    let id: String
    let name: String
    let valueName: String?
    let valueType: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
        case valueType = "value_type"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
