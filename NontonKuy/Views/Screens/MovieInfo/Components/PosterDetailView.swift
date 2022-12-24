//
//  PosterDetailView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct PosterDetailView: View {
    let posterHeight = UIScreen.main.bounds.height - 400
    
    var body: some View {
        ZStack(alignment: .center) {
            Image.ui.samplePoster
                .resizable()
                .scaledToFill()
                .frame(height: posterHeight)
                .clipped()
            
            LinearGradient(colors: [Color.ui.background, .clear], startPoint: .top, endPoint: .center)
            
            Button {
            } label: {
                Label("Play", systemImage: "play")
                    .labelStyle(.iconOnly)
                    .font(.title)
                    .padding(24)
                    .background {
                        Circle()
                            .foregroundColor(Color.ui.background)
                    }
            }
        }
    }
}

struct PosterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PosterDetailView()
    }
}
