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
            }
            
            .navigationTitle(Text("NontonKuy."))
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color.ui.background)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
