//
//  CategoriesView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct CategoriesView: View {
    let categories: [CategoryModel]
    
    // Configuración de las columnas
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    // Alto de las filas
    @State private var rowHeights: [Int: CGFloat] = [:]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("featured-categories")
                .font(.headline)
                .padding(.horizontal)
                .padding(.bottom, 16)
            
            LazyVGrid(columns: columns) {
                ForEach(Array(categories.enumerated()), id: \.element.id) { index, category in
                    NavigationLink(destination: ResultsView(category: category.id)) {
                        Text(category.name)
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(geoReaderBackground(index: index))
                            .frame(height: rowHeights[Int(index / 2)])
                            .background(Color(hex: "fee603"))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func geoReaderBackground(index: Int) -> some View {
        GeometryReader { geo in
            Color.clear
                .onAppear {
                    let row = index / 2
                    let height = geo.size.height
                    if height > (rowHeights[row] ?? 0) {
                        rowHeights[row] = height
                    }
                }
        }
    }
}

#Preview {
    CategoriesView(categories: [
        CategoryModel(id: "MCO1747", name: "Accesorios para Vehículos"),
        CategoryModel(id: "MCO441917", name: "Agro"),
        CategoryModel(id: "MCO1403", name: "Alimentos y Bebidas"),
        CategoryModel(id: "MCO1071", name: "Animales y Mascotas"),
        CategoryModel(id: "MCO1367", name: "Antigüedades y Colecciones"),
        CategoryModel(id: "MCO1368", name: "Arte, Papelería y Mercería"),
        CategoryModel(id: "MCO1384", name: "Bebés"),
        CategoryModel(id: "MCO1246", name: "Belleza y Cuidado Personal"),
        CategoryModel(id: "MCO40433", name: "Boletas para Espectáculos"),
        CategoryModel(id: "MCO1039", name: "Cámaras y Accesorios"),
    ])
}
