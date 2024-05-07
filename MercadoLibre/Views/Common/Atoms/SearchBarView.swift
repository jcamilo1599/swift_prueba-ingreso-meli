//
//  SearchBarView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack {
            TextField("field-search", text: .constant(""))
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    SearchBarView()
}
