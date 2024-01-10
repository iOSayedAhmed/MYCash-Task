//
//  HomeCategoryModel.swift
//  MYCash-Task
//
//  Created by iOSAYed on 10/01/2024.
//

import Foundation

// MARK: - HomeCategoryModel
struct HomeCategoryModel: Codable {
    let success: Bool?
    let responseCode: Int?
    let message: String?
    let data: CategoryData?

    enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case message, data
    }
}

// MARK: - DataClass
struct CategoryData: Codable {
    let data: [Category]?
    let cartCount: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case cartCount = "cart_count"
    }
}

// MARK: - Datum
struct Category: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let active: Int?
    let nameAr, nameEn: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image, active
        case nameAr = "name_ar"
        case nameEn = "name_en"
    }
}
