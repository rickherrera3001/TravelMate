//
//  TravelDetailViewModel.swift
//  TravelMate
//
//  Created by Ricardo Developer on 10/06/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    static let shared = DetailViewModel()
    @Published var favorites: [TravelMate] = []
    private let key = "Favorites"
    
    init() {
        loadFavorites()
    }
    
    func addToFavorites(detalleDestinos: TravelMate) {
        if !favorites.contains(where: { $0.data.info == detalleDestinos.data.info }) {
            favorites.append(detalleDestinos)
            saveFavorites()
        }
    }
    
    func removeFromFavorites(detalleDestinos: TravelMate) {
        if let index = favorites.firstIndex(where: { $0.data.info == detalleDestinos.data.info }) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
//    func isFavorite(detalleDestinos: TravelMate) -> Bool {
//        return favorites.contains { $0.data.info == detalleDestinos.data.info }
//    }
    
    func isFavorite(detalleDestinos: TravelMate) -> Bool {
        return favorites.contains(detalleDestinos)
    }

    
    func saveFavorites() {
        do {
            let encoded = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(encoded, forKey: key)
        } catch {
            print("Failed to encode favorites: \(error)")
        }
    }
    
    
    func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let decoded = try JSONDecoder().decode([TravelMate].self, from: data)
                favorites = decoded
            } catch {
                print("Failed to decode favorites: \(error)")
            }
        } else {
            favorites = []
        }
    }
}
