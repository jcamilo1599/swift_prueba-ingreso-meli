//
//  HomeView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 5/05/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @ObservedObject var preferences = UserPreferencesService.shared
    
    var body: some View {
        NavigationStack {
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
                .navigationTitle("app-name")
                .searchable(text: $viewModel.searchText)
                .navigationBarItems(
                    trailing: HStack {
                        FlagCountryView(countryCode: preferences.countryCode)
                        ShoppingCartBtnView()
                    }
                )
                
                SearchView(text: viewModel.searchText)
            }
        }
        .onAppear {
            viewModel.getSettings()
        }
        .onChange(of: preferences.countryCode, initial: false) { old, new in
            if old != new {
                viewModel.getSettings()
            }
        }
    }
}

#Preview {
    HomeView()
}
