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
            ScrollView {
                VStack {
                    SearchBarView()
                    CarouselView()
                }
            }
            .ignoresSafeArea(edges: [.leading, .trailing])
            .navigationTitle("app-name")
            .navigationBarItems(
                trailing: HStack {
                    FlagCountryView(countryCode: preferences.countryCode)
                    ShoppingCartBtnView()
                }
            )
        }
    }
}

#Preview {
    HomeView()
}
