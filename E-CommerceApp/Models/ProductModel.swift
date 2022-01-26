//
//  ProductModel.swift
//  E-CommerceApp
//
//  Created by Mohamed on 11/10/2021.
//


import Foundation
struct ProductModel : Codable {
    let id : String?
    let image : String?
    let name : String?
    let sDescription : String?
    let lDescription : String?
    let rate : Int?
    let price : String?
    let fav : Int?
    let satelliteServicePrice : String?
    let programType : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case image = "image"
        case name = "name"
        case sDescription = "sDescription"
        case lDescription = "lDescription"
        case rate = "rate"
        case price = "price"
        case fav = "fav"
        case satelliteServicePrice = "satelliteServicePrice"
        case programType = "programType"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sDescription = try values.decodeIfPresent(String.self, forKey: .sDescription)
        lDescription = try values.decodeIfPresent(String.self, forKey: .lDescription)
        rate = try values.decodeIfPresent(Int.self, forKey: .rate)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        fav = try values.decodeIfPresent(Int.self, forKey: .fav)
        satelliteServicePrice = try values.decodeIfPresent(String.self, forKey: .satelliteServicePrice)
        programType = try values.decodeIfPresent(String.self, forKey: .programType)
    }

}
