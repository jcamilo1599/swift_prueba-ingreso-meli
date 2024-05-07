//
//  ResultsView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct ResultsView: View {
    var searchText: String

    var body: some View {
        VStack {
            Text("\(searchText)")
                
        }
        .navigationTitle("results")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ResultsView(searchText: "busqueda...")
}
