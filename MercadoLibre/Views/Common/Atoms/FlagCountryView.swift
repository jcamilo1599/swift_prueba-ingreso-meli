//
//  FlagCountryView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct FlagCountryView: View {
    let countryCode: String?
    
    var body: some View {
        var flagURL: URL? {
            if let countryCode = countryCode, let flagcdn = ProcessInfo.processInfo.environment["FLAG_CDN"] {
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
    }
}

#Preview {
    FlagCountryView(countryCode: "CO")
}
