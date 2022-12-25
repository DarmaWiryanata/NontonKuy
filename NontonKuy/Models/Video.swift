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
}

struct VideosResults: Codable {
    let results: [Movie]
}
