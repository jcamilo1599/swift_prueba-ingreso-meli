//
//  ErrorApiView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct ErrorApiView: View {
    var body: some View {
        Text("error-api")
            .foregroundStyle(.red)
            .bold()
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}

#Preview {
    ErrorApiView()
}
