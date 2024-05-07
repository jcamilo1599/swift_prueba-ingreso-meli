//
//  SearchView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct SearchView: View {
    var text: String?
    
    var body: some View {
        if text != nil && text?.count ?? 0 > 0 {
            ZStack {
                Color.white
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SearchView(text: "text...")
}
