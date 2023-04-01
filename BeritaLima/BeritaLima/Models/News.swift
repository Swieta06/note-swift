//
//  NewsFile.swift
//  BeritaLima
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
struct News:Decodable{
    let id:Int
    let title:String
    let abstract:String
    let publishedDate:String
    let section:String
    let media:[Media]
    let url:String
    
    enum CodingKeys:String,CodingKey{
        case id
        case title
        case abstract
        case publishedDate="published_date"
        case section
        case media
        case url
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.abstract = try container.decodeIfPresent(String.self, forKey: .abstract) ?? ""
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate) ?? ""
        self.section = try container.decodeIfPresent(String.self, forKey: .section) ?? ""
        self.media = try container.decodeIfPresent([Media].self, forKey: .media) ?? []
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
