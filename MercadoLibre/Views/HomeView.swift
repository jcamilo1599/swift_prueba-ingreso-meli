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
                }
            }
            .navigationTitle("app-name")
            .navigationBarItems(trailing: HStack {
                var flagURL: URL? {
                    if let countryCode = preferences.countryCode, let flagcdn = ProcessInfo.processInfo.environment["FLAG_CDN"] {
                        return URL(string: "https://\(flagcdn)/h40/\(countryCode.lowercased()).png")
                    }
                    
                    return nil
                }
                
                if let flag = flagURL {
                    NavigationLink(destination: SelectSiteView(isIntro: false)) {
                        ImageView(imageURL: flag)
                            .frame(minWidth: 40, maxWidth: 40, minHeight: 28, maxHeight: 28)
                            .scaledToFit()
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
                }
            })
        }
    }
}

#Preview {
    HomeView()
}
