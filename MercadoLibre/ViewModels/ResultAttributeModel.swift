//
//  ResultAttributeModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

struct ResultAttributeModel: Codable {
    let id, name: String
    let valueID, valueName: String?
    let attributeGroupID: String
    let attributeGroupName: String
    let source: Double?
    let valueType: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case source
        case valueType = "value_type"
    }
}
