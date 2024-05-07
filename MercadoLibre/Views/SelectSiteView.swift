//
//  SelectSiteView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import SwiftUI

struct SelectSiteView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel = SelectSiteViewModel()
    @ObservedObject var preferences = UserPreferencesService.shared
    
    // Determina si la vista se carga como introducción
    @State var isIntro = true
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView(NSLocalizedString("loading", comment: ""))
                } else if viewModel.sites.isEmpty {
                    Text("no-sites")
                } else {
                    List(viewModel.sites, id: \.id) { site in
                        HStack {
                            if let flag = site.flagURL {
                                ImageView(imageURL: flag)
                                    .frame(minWidth: 40, maxWidth: 40, minHeight: 28, maxHeight: 28)
                                    .scaledToFit()
                                    .cornerRadius(4)
                                    .shadow(radius: 2)
                            }
                            
                            Text(site.name)
                        }
                        .onTapGesture {
                            preferences.countryCode = site.countryCode
                            preferences.countryId = site.id
                            preferences.defaultCurrencyId = site.defaultCurrencyId
                            
                            if !isIntro {
                                // Cierra la vista actual
                                self.presentationMode.wrappedValue.dismiss()
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle(isIntro ? "app-name" : "select-country")
        }
        .onAppear {
            viewModel.getSites()
        }
    }
}

#Preview {
    SelectSiteView()
}
