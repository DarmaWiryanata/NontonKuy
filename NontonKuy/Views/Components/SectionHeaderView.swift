//
//  SectionHeaderView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        NavigationLink {
        } label: {
            HStack {
                // Section title
                Text(title)
                    .bold()
                    .foregroundColor(Color.ui.primaryText)
                
                Spacer()
                
                // Chevron button
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.ui.secondaryText)
            }
            .font(.title2)
            .padding()
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "Trending Now")
            .preferredColorScheme(.dark)
    }
}
