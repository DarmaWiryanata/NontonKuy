//
//  MovieViewModel.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import Combine
import Foundation

class MovieViewModel: ObservableObject {
    @Published var trendingMovies = [Movie]()
    var cancellables = Set<AnyCancellable>()
    
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
        getTrendingMovies()
    }
    
    private func getTrendingMovies() {
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/discover/movie?language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate&api_key=\(Config.tmdbApiKey)") else { return }

        // 1. Sign up for monthly subscription for package to be delivered
        // 2. The company would make the package behind the scene
        // 3. Receive the package at the front doot
        // 4. Make sure the box isn't damaged
        // 5. Open and make sure the item is correct
        // 6. Use the item
        // 7. Cancellable at any time
        
        // 1. Create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        
        // 2. Subscribe publisher on background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        
        // 3. Receive on main thread
            .receive(on: DispatchQueue.main)
        
        // 4. tryMap (check that the data is good)
            .tryMap(handleOutput)
        
        // 5. Decode (decode data into Post model)
            .decode(type: TrendingMoviesResults.self, decoder: JSONDecoder())
        
        // 6. Sink (put the item into our app)
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { [weak self] (results) in
                self?.trendingMovies = results.results
            })
        
        // 7. Store (cancel subscription if needed)
            .store(in: &cancellables)
        
        func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
            guard
                let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
            
            return output.data
        }
    }
}

struct TrendingMoviesResults: Codable {
    let results: [Movie]
}
