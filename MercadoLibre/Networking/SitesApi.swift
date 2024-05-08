//
//  SitesApi.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import Alamofire
import Foundation

class SitesApi {
    private let userPreferences: UserPreferencesService
    
    init(userPreferences: UserPreferencesService = .shared) {
        self.userPreferences = userPreferences
    }
    
    func getAll(completion: @escaping (Result<[SitesModel], Error>) -> Void) {
        let baseUrl = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? "api.mercadolibre.com"
        let urlString = "https://\(baseUrl)/sites"
        
        AF.request(urlString).responseDecodable(of: [SitesModel].self) { response in
            switch response.result {
            case .success(let resources):
                completion(.success(resources))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSettings(completion: @escaping (Result<SiteConfigModel, Error>) -> Void) {
        let baseUrl = ProcessInfo.processInfo.environment["API_BASE_URL"] ?? "api.mercadolibre.com"
        let defaultCountryId = ProcessInfo.processInfo.environment["DEFAULT_COUNTRY_ID"] ?? ""
        let countryId = userPreferences.countryId ?? defaultCountryId
        let urlString = "https://\(baseUrl)/sites/\(countryId)"
        
        AF.request(urlString).responseDecodable(of: SiteConfigModel.self) { response in
            switch response.result {
            case .success(let resources):
                completion(.success(resources))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
