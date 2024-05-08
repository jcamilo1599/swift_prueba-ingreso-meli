//
//  ProductsApi.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 5/05/24.
//

import Alamofire
import Foundation

class ProductsApi {
    private let userPreferences: UserPreferencesService
    
    init(userPreferences: UserPreferencesService = .shared) {
        self.userPreferences = userPreferences
    }
    
    func getBySearch(search: String, completion: @escaping (Result<ProductsRespModel, Error>) -> Void) {
        let baseUrl = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? "api.mercadolibre.com"
        let defaultCountryId = ProcessInfo.processInfo.environment["DEFAULT_COUNTRY_ID"] ?? ""
        let countryId = userPreferences.countryId ?? defaultCountryId
        let urlString = "https://\(baseUrl)/sites/\(countryId)/search?q=\(search)"
        
        AF.request(urlString).responseDecodable(of: ProductsRespModel.self) { response in
            switch response.result {
            case .success(let resources):
                completion(.success(resources))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getByCategory(category: String, completion: @escaping (Result<ProductsRespModel, Error>) -> Void) {
        let baseUrl = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? "api.mercadolibre.com"
        let defaultCountryId = ProcessInfo.processInfo.environment["DEFAULT_COUNTRY_ID"] ?? ""
        let countryId = userPreferences.countryId ?? defaultCountryId
        let urlString = "https://\(baseUrl)/sites/\(countryId)/search?category=\(category)"
        
        AF.request(urlString).responseDecodable(of: ProductsRespModel.self) { response in
            switch response.result {
            case .success(let resources):
                completion(.success(resources))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
