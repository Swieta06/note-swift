//
//  Loan.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

struct Loan: Identifiable,Codable{
    var id = UUID()
    var name : String
    var use : String
    var country : String
    var amount: Int
    
    
    enum CodingKeys: String, CodingKey{
        case name
        case use
        case country = "location"
        case amount = "loan_amount"
    }
    enum LocationsKey: String, CodingKey{
        case country
        
    }

    init(name: String, country: String, use: String, amount: Int) {
        self.name = name
        self.country = country
        self.use = use
        self.amount = amount
    }
  
    init(from decoder:Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name=try values.decode(String.self, forKey: .name)
        //self.name=try values.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
        self.use=try values.decode(String.self, forKey: .use)
        self.amount=try values.decode(Int.self, forKey: .amount)
    
        let location=try values.nestedContainer(keyedBy: LocationsKey.self, forKey: .country)
        self.country=try location.decode(String.self, forKey: .country)
        
    }
}
