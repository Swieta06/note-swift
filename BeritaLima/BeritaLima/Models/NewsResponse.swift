//
//  NewsResponse.swift
//  BeritaLima
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
struct NewsResponse:Decodable{
    let status: String
    let copyRight: String
    let numResult: Int
    let results: [News]
    
    
    enum CodingKeys: String, CodingKey{
        case status
        case copyRight
        case numResul="num_result"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status=try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        copyRight=try container.decodeIfPresent(String.self, forKey: .copyRight) ?? ""
        numResult = try container.decodeIfPresent(Int.self, forKey: .numResul) ?? 0
        results=try container.decodeIfPresent([News].self, forKey: .results) ?? []
    }
}
