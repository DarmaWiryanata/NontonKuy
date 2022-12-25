//
//  Featured.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct FeaturedView: View {
    let movieVM: MovieViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Backdrop
            
            Image.ui.sampleBackdrop
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
            
            // Linear gradient background
            LinearGradient(colors: [.clear, .clear, Color.ui.background.opacity(0.8)],
                           startPoint: .top,
                           endPoint: .bottom)
            
            // Featured title & rating
            HStack(alignment: .bottom) {
                // Title
                Text(movieVM.trendingMovies[0].title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
                
                Spacer()
                
                // Rating
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("4.1")
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(
                    Capsule()
                        .foregroundColor(Color.ui.background)
                )
                
            }
            .foregroundColor(Color.ui.primaryText)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(movieVM: MovieViewModel())
    }
}
