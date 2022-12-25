//
//  Review.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import Foundation

struct ReviewsResults: Codable {
    let results: [Result]
}

struct Review: Codable {
    let id: Int
    let author: String
    let authorDetails: AuthorDetails
    let content, createdAt, updatedAt, url: String
    
    enum CodingKeys: String, CodingKey {
        case id, author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case url
    }
}

struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
