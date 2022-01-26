//
//  UserModel.swift
//  MGServices
//
//  Created by Gehad Ahmed on 14/09/2021.
//

import Foundation
struct UserModel : Codable {
    let statusCode : Int?
    let message : String?
    let data : UserData?

    init(statusCode:Int? = nil, message: String? = nil, data: UserData? = nil) {
        self.statusCode = statusCode
        self.message = message
        self.data = data
    }
     
    
    
    enum CodingKeys: String, CodingKey {

        case statusCode = "statusCode"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(UserData.self, forKey: .data)
    }

}

struct UserData : Codable {
    let id : String?
    let password : String?
    let name : String?
    let email : String?
    let government : String?
    let city : String?
    let street : String?
    let user_token : String?
    let phone : String?
    let image : String?
    let type : String?
    let bio : String?
    
    init(id:String? = nil,password:String? = nil,name:String,email:String? = nil,government:String? = nil,city:String? = nil,street:String? = nil,user_token:String? = nil,phone:String,image:String? = nil,type:String? = nil,bio:String? = nil){
        
        self.id = id
        self.password = password
        self.name = name
        self.email = email
        self.government = government
        self.city = city
        self.street = street
        self.user_token = user_token
        self.phone = phone
        self.image = image
        self.type = type
        self.bio = bio
    }
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case password = "password"
        case name = "name"
        case email = "email"
        case government = "government"
        case city = "city"
        case street = "street"
        case user_token = "user_token"
        case phone = "phone"
        case image = "image"
        case type = "type"
        case bio = "bio"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        government = try values.decodeIfPresent(String.self, forKey: .government)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        user_token = try values.decodeIfPresent(String.self, forKey: .user_token)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
    }

}



