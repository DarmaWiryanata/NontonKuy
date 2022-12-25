//
//  ShowCellView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct MovieCellView: View {
    let rank: Int?
    
    var body: some View {
        NavigationLink {
            MovieInfoScreen(title: "Avatar")
        } label: {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image.ui.samplePoster
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    if let rank = rank {
                        Text("\(rank)")
                            .font(.callout)
                            .padding()
                            .overlay {
                                Circle()
                                    .stroke(
                                        Color.ui.accent,
                                        style: StrokeStyle(lineWidth: 3)
                                    )
                                    .foregroundColor(Color.ui.background)
                            }
                            .background {
                                Circle()
                                    .foregroundColor(Color.ui.background)
                            }
                            .padding(.trailing, 8)
                    }
                }
                .padding(.trailing)
                
                Text("Avatar: The Way of Water")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.ui.primaryText)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 8)
                
                Text("Action, Adventure")
                    .foregroundColor(Color.ui.secondaryText)
            }
        }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView(rank: 1)
            .preferredColorScheme(.dark)
    }
}
