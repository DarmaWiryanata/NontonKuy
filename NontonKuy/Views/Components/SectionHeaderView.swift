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
        HStack {
            Text(title)
                .bold()
                .foregroundColor(Color.ui.primaryText)
            
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "Trending Now")
            .preferredColorScheme(.dark)
    }
}
