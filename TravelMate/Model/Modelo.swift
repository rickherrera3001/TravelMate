//
//  Modelo.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import Foundation

// MARK: - TravelMate
struct TravelMate: Codable, Equatable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable, Equatable {
    let info: String
    let imageURL: String
    let countryImages: [CountryImage]

    enum CodingKeys: String, CodingKey {
        case info
        case imageURL = "image_url"
        case countryImages = "country_images"
    }
}

// MARK: - CountryImage
struct CountryImage: Codable, Equatable {
    let imageURL: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case title
    }
}
