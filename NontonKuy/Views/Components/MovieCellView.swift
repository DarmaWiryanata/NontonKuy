//
//  ShowCellView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct MovieCellView: View {
    let movie: Movie
    let rank: Int?
    
    var body: some View {
        NavigationLink {
            MovieInfoScreen(title: movie.title, movie: movie)
        } label: {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        Text("Loading ...")
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .redacted(reason: .placeholder)
                    }
                    
                    if let rank = rank {
                        Text("\(rank)")
                            .font(.callout)
                            .padding()
                            .overlay {
                                Circle()
                                    .stroke(
                                        Color.ui.accent,
                                        style: StrokeStyle(lineWidth: 3)
                                    )
                                    .foregroundColor(Color.ui.background)
                            }
                            .background {
                                Circle()
                                    .foregroundColor(Color.ui.background)
                            }
                            .padding(.trailing, 8)
                    }
                }
                
                Text(movie.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.ui.primaryText)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .padding(.top, 8)
                
                Text(String(movie.releaseDate.prefix(4)))
                    .foregroundColor(Color.ui.secondaryText)
            }
        }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(movie: Movie(
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
        ), rank: 1)
            .preferredColorScheme(.dark)
    }
}
