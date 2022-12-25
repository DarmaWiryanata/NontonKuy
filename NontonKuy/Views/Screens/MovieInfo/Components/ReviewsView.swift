//
//  ReviewsView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct ReviewsView: View {
    @ObservedObject var vm: ReviewViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: "Review")
            
            if vm.movieReviews.count > 0 {
                ForEach(vm.movieReviews) { review in
                    HStack {
                        // Author avatar
                        if let avatarPath = review.authorDetails.avatarPath {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(avatarPath)")!) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .foregroundColor(Color.ui.background)
                                    .frame(width: 30, height: 30)
                                    .overlay {
                                        Image(systemName: "person.fill")
                                    }
                            }
                        }
                        
                        // Author name
                        HStack {
                            Text(review.author)
                                .multilineTextAlignment(.leading)
                            
                            SeparatorView()
                                .padding(.horizontal, 8)
                            
                            RateView(value: review.authorDetails.rating)
                        }
                    }
                    
                    Text(review.content)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    Divider()
                }
                .padding(.horizontal)
            } else {
                Text("No review yet")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView(vm: ReviewViewModel())
            .preferredColorScheme(.dark)
    }
}
