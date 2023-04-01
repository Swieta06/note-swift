//
//  Media.swift
//  BeritaLima
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
struct Media: Decodable{
    let metaData: [MediaMetadata]
    enum CodingKeys: String,CodingKey{
        case metadata="media-metadata"
    }
    init(from decoder: Decoder) throws {
        let container=try decoder.container(keyedBy:CodingKeys.self)
        metaData=try container.decodeIfPresent([MediaMetadata].self,forKey: .metadata) ?? []
    }
}
