//
//  CarouselView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct CarouselView: View {
    @State private var isLandscape = false
    private let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    
    var body: some View {
        let height = UIScreen.main.bounds.height / (isPhone && !isLandscape ? 5 : 3)
        
        TabView {
            ForEach(0..<4) { num in
                Image("cover-\(num)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: height)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: height)
        .onAppear {
            self.updateOrientation()
            
            NotificationCenter.default.addObserver(
                forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    self.updateOrientation()
                }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    private func updateOrientation() {
        isLandscape = [UIDeviceOrientation.landscapeLeft, UIDeviceOrientation.landscapeRight].contains(UIDevice.current.orientation)
    }
}

#Preview {
    CarouselView()
}
