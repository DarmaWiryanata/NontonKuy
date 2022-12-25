//
//  ContentView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 23/12/22.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var movieVM = MovieViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                // MARK: Featured movie
                FeaturedView()
                    .padding(.bottom)
                
                // MARK: Most popular
                SectionHeaderView(title: "Most Popular")
                MovieListView()
                    .padding(.bottom)
                
                // MARK: Now playing
                SectionHeaderView(title: "Now Playing")
                MovieGridView(vm: movieVM)
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
