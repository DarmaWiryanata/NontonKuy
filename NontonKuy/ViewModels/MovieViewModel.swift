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
    @Published var isLoadingPage = false
    
    private var currentPage = 1
    private var canLoadMorePages = true
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTrendingMovies()
    }
    
    func loadMoreContentIfNeeded(currentMovie movie: Movie?) {
        guard let movie = movie else {
            getTrendingMovies()
            return
        }

        let thresholdIndex = trendingMovies.index(trendingMovies.endIndex, offsetBy: -5)
        if trendingMovies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
            getTrendingMovies()
        }
    }
    
    private func getTrendingMovies() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        isLoadingPage = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/discover/movie?language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(currentPage)&with_watch_monetization_types=flatrate&api_key=\(Config.tmdbApiKey)") else { return }

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
            .handleEvents(receiveOutput: { response in
                self.canLoadMorePages = true
                self.isLoadingPage = false
                self.currentPage += 1
            })
        
        // 4. tryMap (check that the data is good)
            .tryMap(handleOutput)
        
        // 5. Decode (decode data into Post model)
            .decode(type: MoviesResults.self, decoder: JSONDecoder())
        
        // 6. Sink (put the item into our app)
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { [weak self] (results) in
                self?.trendingMovies.append(contentsOf: results.results)
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
