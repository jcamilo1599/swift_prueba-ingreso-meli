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
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("$\(product.price)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        }
    }
    
    private var products: [ProductModel] {
        if let results = viewModel.products?.results {
            return results
        }
        
        return []
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
