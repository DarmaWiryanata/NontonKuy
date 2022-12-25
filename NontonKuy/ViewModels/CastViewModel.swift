//
//  CastViewModel.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import Combine
import Foundation

class CastViewModel: ObservableObject {
    @Published var movieCasts = [Cast]()
    
    private var cancellables = Set<AnyCancellable>()
    
    func getCasts(id: Int) {
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/movie/\(id)/casts?&api_key=\(Config.tmdbApiKey)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: CastsResults.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in

            }, receiveValue: { [weak self] (results) in
                self?.movieCasts = results.cast
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
