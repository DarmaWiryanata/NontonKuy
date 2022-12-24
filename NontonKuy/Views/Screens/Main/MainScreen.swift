//
//  ContentView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 23/12/22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                FeaturedView()
                    .padding(.bottom)
                
                // MARK: Now Playing
                SectionHeaderView(title: "Now Playing")
                MovieListView(ranked: false)
                    .padding(.bottom)
                
                // MARK: Most Popular
                SectionHeaderView(title: "Most Popular")
                MovieListView(ranked: true)
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
