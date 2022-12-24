//
//  ShowsView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct MovieListView: View {
    let ranked: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                    .frame(width: 20)
                
                ForEach(0 ..< 5) { i in
                    MovieCellView(rank: ranked ? "\(i + 1)" : "")
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(ranked: true)
            .preferredColorScheme(.dark)
    }
}
