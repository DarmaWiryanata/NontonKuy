//
//  ShowsView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct ShowsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                    .frame(width: 20)
                
                ForEach(0 ..< 5) { item in
                    ShowCellView()
                }
            }
        }
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
            .preferredColorScheme(.dark)
    }
}
