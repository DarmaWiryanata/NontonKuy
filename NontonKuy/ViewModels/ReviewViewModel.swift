//
//  ReviewViewModel.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import Combine
import Foundation

class ReviewViewModel: ObservableObject {
    @Published var movieReviews = [Review]()
    
    private var cancellables = Set<AnyCancellable>()
    
    func getReviews(id: Int) {
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/movie/\(id)/reviews?&api_key=\(Config.tmdbApiKey)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: ReviewsResults.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                print(completion)
            }, receiveValue: { [weak self] (results) in
                self?.movieReviews = results.results
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
