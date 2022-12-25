//
//  Cast.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import Foundation

// MARK: - Review
struct CastsResults: Codable {
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Identifiable, Codable {
    let id: Int
    let knownForDepartment: String
    let name, originalName: String
    let profilePath: String?
    let character: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case profilePath = "profile_path"
        case character
    }
}

