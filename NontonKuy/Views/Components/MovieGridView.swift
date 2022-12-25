//
//  MovieGridView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct MovieGridView: View {
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            MovieCellView(rank: nil)
            MovieCellView(rank: nil)
        }
        .padding(.horizontal)
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView()
            .preferredColorScheme(.dark)
    }
}
