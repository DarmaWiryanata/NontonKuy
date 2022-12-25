//
//  PosterDetailView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct PosterDetailView: View {
    let movie: Movie
    
    let posterHeight = UIScreen.main.bounds.height - 400
    let gradientColors = [Color.ui.background, .clear, Color.ui.background]
    
    var body: some View {
        ZStack(alignment: .center) {
            // Poster image
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1280/\(movie.posterPath)")!) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: posterHeight)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .foregroundColor(Color.ui.background)
                    .frame(height: posterHeight)
            }
            
            // Poster top gradient effect
            LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
            
            VStack {
                Spacer()
                
                HStack {
                    // Rate
                    Group {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text(String(format: "%.1f", movie.voteAverage))
                            .foregroundColor(Color.ui.primaryText)
                    }
                    
                    // Separator
                    separator
                    
                    // Release year
                    Text(movie.releaseDate.prefix(4))
                        .foregroundColor(Color.ui.primaryText)
                }
                .padding(.bottom)
            }
            
            Button {
            } label: {
                Label("Play", systemImage: "play")
                    .labelStyle(.iconOnly)
                    .font(.title)
                    .padding(24)
                    .background {
                        Circle()
                            .foregroundColor(Color.ui.background)
                    }
            }
        }
    }
    
    var separator: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 5, height: 5)
            .foregroundColor(Color.ui.primaryText)
            .padding(.horizontal)
    }
}

struct PosterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PosterDetailView(movie: Movie(id: 76600,
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
                                      voteCount: 1001))
            .frame(maxHeight: UIScreen.main.bounds.height - 400)
    }
}
