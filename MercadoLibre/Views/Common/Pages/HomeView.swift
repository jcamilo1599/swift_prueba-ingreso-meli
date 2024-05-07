//
//  HomeView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 5/05/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var navigateToResults = false
    
    var body: some View {
        NavigationStack {
            mainContent()
                .navigationTitle("app-name")
                .searchable(
                    text: $viewModel.searchText,
                    prompt: Text("field-search")
                )
                .onSubmit(of: .search) {
                    if viewModel.searchText.count > 0 {
                        navigateToResults = true
                    }
                }
                .navigationBarItems(
                    trailing: HStack {
                        FlagCountryView(countryCode: viewModel.prefs.countryCode)
                        ShoppingCartBtnView()
                    }
                )
                .navigationDestination(isPresented: $navigateToResults) {
                    // Navegación programática a la vista de resultados
                    ResultsView(searchText: viewModel.searchText)
                }
                .onAppear {
                    navigateToResults = false
                    viewModel.getSettings()
                }
                .onChange(of: viewModel.prefs.countryCode, initial: false) { old, new in
                    if old != new {
                        viewModel.getSettings()
                    }
                }
        }
    }
    
    private func mainContent() -> some View {
        ZStack {
            ScrollView {
                VStack {
                    CarouselView()
                    
                    Spacer().frame(height: 30)
                    
                    if let categories = viewModel.settings?.categories {
                        CategoriesView(categories: categories)
                    } else if viewModel.errorMessage != nil {
                        ErrorApiView()
                    }
                }
            }
            .ignoresSafeArea(edges: [.leading, .trailing])
            
            // Vista del buscador
            SearchView(searchText: viewModel.searchText)
        }
    }
    
    @ViewBuilder
    private func categoriesOrErrorView() -> some View {
        if let categories = viewModel.settings?.categories {
            CategoriesView(categories: categories)
        } else if viewModel.errorMessage != nil {
            ErrorApiView()
        }
    }
}

#Preview {
    HomeView()
}
