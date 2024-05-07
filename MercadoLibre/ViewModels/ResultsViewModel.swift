//
//  ResultsViewModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

class ResultsViewModel: ObservableObject {
    @ObservedObject var prefs = UserPreferencesService.shared
    
    @Published var isLoading = false
    @Published var products: ProductsRespModel?
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    private let productsApi = ProductsApi()
    
    // Obtiene con base a parámetros de busqueda
    func getBySearch(search: String) {
        isLoading = true
        productsApi.getBySearch(search: search) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // Obtiene con base a una categoría
    func getByCategory(category: String) {
        isLoading = true
        productsApi.getByCategory(category: category) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
