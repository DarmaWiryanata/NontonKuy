//
//  ContentView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 23/12/22.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var movieVM = MovieViewModel()
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(movieVM.movies) { movie in
                        MovieCellView(movie: movie, rank: nil)
                            .onAppear {
                                movieVM.loadMoreContentIfNeeded(currentMovie: movie)
                            }
                    }
                    
                    if movieVM.isLoadingPage {
                        ProgressView()
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.ui.background)
            
            .navigationTitle(Text("NontonKuy."))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .preferredColorScheme(.dark)
    }
}
