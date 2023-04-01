//
//  AccesToken.swift
//  MealMonkey
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

struct AccesToken: Codable{
    let accesToken: String
    let refreshToken: String
    
    enum CodingKeys:String,CodingKey {
        case accesToken="access_token"
        case refreshToken="refresh_token"
    }
    // Data to Object
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accesToken = try container.decode(String.self, forKey: .accesToken)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.accesToken, forKey: .accesToken)
        try container.encode(self.refreshToken, forKey: .refreshToken)
    }
}
