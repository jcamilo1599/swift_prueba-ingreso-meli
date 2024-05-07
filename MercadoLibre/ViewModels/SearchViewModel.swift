//
//  SearchViewModel.swift
//  MercadoLibre
//
//  Created by Juan Camilo Marín Ochoa on 7/05/24.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)  // Cambia el tiempo de debounce según tus necesidades
            .removeDuplicates()
            .sink { [weak self] text in
                self?.performSearch(text: text)
            }
    }
    
    func performSearch(text: String) {
        // Aquí invocarías tu API de búsqueda
        print("Searching for \(text)")
    }
}
