//
//  InfoView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct InfoView: View {
    let overview: String
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: "Overview")
            Text(overview)
                .padding(.horizontal)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(overview: "lorem ipsum")
            .preferredColorScheme(.dark)
    }
}
