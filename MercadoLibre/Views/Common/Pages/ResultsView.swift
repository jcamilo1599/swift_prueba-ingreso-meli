//
//  ResultsView.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import SwiftUI

struct ResultsView: View {
    @StateObject private var viewModel = ResultsViewModel()
    
    var searchText: String?
    var category: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView(NSLocalizedString("loading", comment: ""))
                } else if products.isEmpty {
                    Text("no-products")
                } else {
                    buildList()
                }
            }
            .navigationTitle(getTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if let searchText = searchText {
                viewModel.getBySearch(search: searchText)
            }
            
            if let category = category {
                viewModel.getByCategory(category: category)
            }
        }
    }
    
    private func buildList() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(products, id: \.id) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        buildProduct(product: product)
                    }
                }
            }
        }
    }
    
    private func buildProduct(product: ProductModel) -> some View {
        HStack {
            ImageView(imageURL: URL(string: product.thumbnail)!)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
                .frame(width: 10)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Text(product.price != nil ? "$\(product.price!)" : "price-not-available")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
    private var products: [ProductModel] {
        if let results = viewModel.products?.results {
            return results
        }
        
        return []
    }
    
    private func getPrice(price: Double) -> String {
        return String(price).components(separatedBy: ",")[0]
    }
    
    private var getTitle: String {
        if searchText != nil {
            return NSLocalizedString("results-search", comment: "")
        } else {
            return NSLocalizedString("results-category", comment: "")
        }
    }
}

#Preview {
    ResultsView()
}
