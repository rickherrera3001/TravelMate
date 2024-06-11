//
//  WelcomeViewModel.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import Foundation
import Combine

class TravelMateViewModel: ObservableObject {
    
    @Published var travelMate: TravelMate? 
    @Published var travels: [TravelMate]?
    @Published var filteredTravels: [CountryImage]?
    @Published var searchResults: [TravelMate] = []
    @Published var errorMessage: String?
    
    
    private var cancellables = Set<AnyCancellable>()
    private let apiClient = APIClient()
    
    
    func fetchTravelMate(for country: String = "turkey") {
        apiClient.travelData(for: country) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let travelMate):
                    self?.travelMate = travelMate
                    self?.filteredTravels = travelMate.data.countryImages
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func searchDestinations(query: String) {
        if let images = travelMate?.data.countryImages {
            filteredTravels = images.filter { $0.title.lowercased().contains(query.lowercased()) }
        } else {
            filteredTravels = []
        }
    }
}

