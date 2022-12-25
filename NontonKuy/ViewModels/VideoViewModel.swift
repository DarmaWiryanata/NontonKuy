//
//  VideoViewModel.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import Combine
import Foundation

class VideoViewModel: ObservableObject {
    @Published var movieVideos = [Video]()
    @Published var isLoadingVideo = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func getVideos(id: Int) {
        isLoadingVideo = true
        
        guard let url = URL(string: "\(Config.tmdbBaseUrl)/movie/\(id)/videos?&api_key=\(Config.tmdbApiKey)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
                self.isLoadingVideo = false
            })
            .tryMap(handleOutput)
            .decode(type: VideosResults.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { [weak self] (results) in
                self?.movieVideos = results.results
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
