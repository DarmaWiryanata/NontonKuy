//
//  MovieGridView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct MovieGridView: View {
    let columns = [GridItem(), GridItem()]
    let vm: MovieViewModel
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.trendingMovies) { movie in
                MovieCellView(movie: movie, rank: nil)
            }
        }
        .padding(.horizontal)
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView(vm: MovieViewModel())
            .preferredColorScheme(.dark)
    }
}
