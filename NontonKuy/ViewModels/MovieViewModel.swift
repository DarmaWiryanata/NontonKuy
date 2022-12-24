//
//  MovieViewModel.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var trendingMovies = [Movie]()
    
    private let movieDummies = Movie(
        id: 76600,
        adult: false,
        backdropPath: "/tQ91wWQJ2WRNDXwxuO7GCXX5VPC.jpg",
        genreIDS: [
            878,
            28,
            12
        ],
        originalLanguage: "en",
        originalTitle: "Avatar: The Way of Water",
        overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
        popularity: 4109.455,
        posterPath: "/94xxm5701CzOdJdUEdIuwqZaowx.jpg",
        releaseDate: "2022-12-14",
        title: "Avatar: The Way of Water",
        video: false,
        voteAverage: 8.1,
        voteCount: 1001
    )
    
    init() {
        
    }
    
    private func getTrendingMovies() {
        trendingMovies.append(movieDummies)
    }
}
