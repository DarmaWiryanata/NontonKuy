//
//  Video.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import Foundation

struct Video: Identifiable, Codable {
    let id, iso6391, iso31661, name, key, site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
    }
}

struct VideosResults: Codable {
    let results: [Video]
}
