//
//  Movie.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 23/12/22.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MoviesResults: Codable {
    let results: [Movie]
}
