//
//  MovieInfoScreen.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct MovieInfoScreen: View {
    @StateObject var videoVM = VideoViewModel()
    @StateObject var reviewVM = ReviewViewModel()
    @StateObject var castVM = CastViewModel()
    @State private var selectedTab = "Info"
    
    let title: String
    let movie: Movie
    var tab = ["Info", "Review"]
    
    var body: some View {
        ScrollView {
            // MARK: Poster
            PosterDetailView(videoVM: videoVM, movie: movie)
            
            // Tab view
            Picker("Tab", selection: $selectedTab) {
                ForEach(tab, id: \.self) {
                    Text($0)
                        .id($0)
                }
            }
            .pickerStyle(.segmented)
            .padding([.top, .horizontal])
            
            if selectedTab == "Info" {
                // MARK: Overview
                InfoView(overview: movie.overview)
                
                // MARK: Casts
                CastsView(casts: castVM.movieCasts)
            } else {
                // MARK: Reviews
                ReviewsView(vm: reviewVM)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            videoVM.getVideos(id: movie.id)
            reviewVM.getReviews(id: movie.id)
            castVM.getCasts(id: movie.id)
        }
        
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieInfoScreen(title: "Avatar: The Way of Water", movie: Movie(
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
            ))
                .preferredColorScheme(.dark)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Label("Back", systemImage: "chevron.left")
                            .labelStyle(.titleAndIcon)
                    }
                }
        }
    }
}
