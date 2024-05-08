//
//  ShoppingCartBtnView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct ShoppingCartBtnView: View {
    var body: some View {
        Button(action: {
        }) {
            Image(systemName: "cart")
                .accessibility(identifier: "CartButton")
        }
    }
}

#Preview {
    ShoppingCartBtnView()
}
