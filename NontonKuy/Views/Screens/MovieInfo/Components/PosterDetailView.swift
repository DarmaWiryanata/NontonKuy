//
//  PosterDetailView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct PosterDetailView: View {
    let posterHeight = UIScreen.main.bounds.height - 400
    let gradientColors = [Color.ui.background, .clear, Color.ui.background]
    
    var body: some View {
        ZStack(alignment: .center) {
            // Poster image
            Image.ui.samplePoster
                .resizable()
                .scaledToFill()
                .frame(height: posterHeight)
                .clipped()
            
            // Poster top gradient effect
            LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
            
            VStack {
                Spacer()
                
                HStack {
                    // Rate
                    Group {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("4.6")
                            .foregroundColor(Color.ui.primaryText)
                    }
                    
                    // Separator
                    separator
                    
                    // Duration
                    Text("2 h 40 mins")
                        .foregroundColor(Color.ui.primaryText)
                    
                    // Separator
                    separator
                    
                    // Release year
                    Text("2021")
                        .foregroundColor(Color.ui.primaryText)
                }
                .padding(.bottom)
            }
            
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
    
    var separator: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 5, height: 5)
            .foregroundColor(Color.ui.primaryText)
            .padding(.horizontal)
    }
}

struct PosterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PosterDetailView()
            .frame(maxHeight: UIScreen.main.bounds.height - 400)
    }
}
