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
            Text("Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.")
                .foregroundColor(Color.ui.secondaryText)
                .padding(.horizontal)
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
