//
//  SearchView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var searchText: String
    
    var body: some View {
        if searchText.count > 0 {
            ZStack {
                Color.white
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SearchView(searchText: "text...")
}
