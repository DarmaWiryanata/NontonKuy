//
//  MovieInfoScreen.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct MovieInfoScreen: View {
    let title: String
    
    var body: some View {
        ScrollView {
            PosterDetailView()
            
            // MARK: Overview
            SectionHeaderView(title: "Overview")
        }
        .edgesIgnoringSafeArea(.top)
        
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieInfoScreen(title: "Avatar: The Way of Water")
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
