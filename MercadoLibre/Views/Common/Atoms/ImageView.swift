//
//  ImageView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 6/05/24.
//

import SwiftUI

struct ImageView: View {
    @State private var imageData: Data?
    @State private var hasSearched = false
    
    let imageURL: URL
    
    var body: some View {
        VStack {
            if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
            } else if (hasSearched) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            fetchImage()
        }
    }
    
    private func fetchImage() {
        URLSession.shared.dataTask(with: imageURL) { data, _, __ in
            DispatchQueue.main.async {
                self.imageData = data
                self.hasSearched = true
            }
        }.resume()
    }
}

#Preview {
    let flagcdn = ProcessInfo.processInfo.environment["FLAG_CDN"] ?? "flagcdn.com"
    
    return ImageView(imageURL: URL(
        string: "https://\(flagcdn)/h40/co.png"
    )!)
}
