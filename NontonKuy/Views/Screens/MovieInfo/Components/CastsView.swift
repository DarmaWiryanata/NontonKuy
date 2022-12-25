//
//  CastsView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct CastsView: View {
    let casts: [Cast]
    
    var body: some View {
        VStack {
            SectionHeaderView(title: "Casts")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    Spacer()
                    
                    ForEach(casts) { cast in
                        VStack(alignment: .leading) {
                            if let profilePath = cast.profilePath {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath)")!) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 200)
                                        .clipped()
                                        .cornerRadius(20)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.ui.background)
                                        .frame(width: 120, height: 200)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color.ui.background)
                                    .frame(width: 120, height: 200)
                                    .overlay {
                                        Image(systemName: "person.fill")
                                    }
                            }
                            
                            Text(cast.originalName)
                            
                            Text(cast.character ?? cast.knownForDepartment)
                                .font(.callout)
                                .foregroundColor(Color.ui.secondaryText)
                        }
                        .frame(width: 150)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct CastsView_Previews: PreviewProvider {
    static var previews: some View {
        CastsView(casts: [Cast]())
    }
}
