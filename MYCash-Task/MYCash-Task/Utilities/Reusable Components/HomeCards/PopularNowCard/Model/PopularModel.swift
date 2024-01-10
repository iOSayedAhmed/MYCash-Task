//
//  PopularModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import Foundation

// MARK: - PopularModel
struct PopularModel: Codable {
    let success: Bool?
    let responseCode: Int?
    let message: String?
    let data: [PopularData]?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - PopularData
struct PopularData: Codable {
    let id: Int?
    let name, email, phone: String?
    let image: String?
    let logo: String?
    let description: String?
    let distance: String?
    let type, status: Int?
    let lat, lng, address, appointments: String?
    let trending, popular: Int?
    let rate: String?
    let isFavorite: Bool?
    let token: String?
    
    

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, image, logo, description, distance, type, status, lat, lng, address, appointments, trending, popular, rate
        case isFavorite = "is_favorite"
        case  token
    }
}




