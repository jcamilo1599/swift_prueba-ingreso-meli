//
//  HomeViewModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var settings: SiteConfigModel?
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    private let sitesApi = SitesApi()

    func getSettings() {
        isLoading = true
        sitesApi.getSettings { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let settings):
                    self?.settings = settings
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
