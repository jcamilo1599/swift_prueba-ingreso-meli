//
//  SelectSiteViewModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import SwiftUI
import Combine

class SelectSiteViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var sites = [SitesModel]()
    @Published var errorMessage: String?
    
    private let sitesApi = SitesApi()

    func getSites() {
        isLoading = true
        sitesApi.getAll { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let sites):
                    self?.sites = sites
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
