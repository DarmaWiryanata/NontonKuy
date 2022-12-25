//
//  MovieViewModel.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import Combine
import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var isLoadingPage = false
    
    private var currentPage = 1
    private var canLoadMorePages = true
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getMovies()
    }
    
    func loadMoreContentIfNeeded(currentMovie movie: Movie?) {
        guard let movie = movie else {
            getMovies()
            return
        }

        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
        if movies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
            getMovies()
        }
    }
    
    private func getMovies() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        isLoadingPage = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/discover/movie?language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(currentPage)&with_watch_monetization_types=flatrate&api_key=\(Config.tmdbApiKey)") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
                self.canLoadMorePages = true
                self.isLoadingPage = false
                self.currentPage += 1
            })
            .tryMap(handleOutput)
            .decode(type: MoviesResults.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { [weak self] (results) in
                self?.movies.append(contentsOf: results.results)
            })
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
