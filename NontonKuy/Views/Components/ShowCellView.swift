//
//  ShowCellView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 24/12/22.
//

import SwiftUI

struct ShowCellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image.ui.samplePoster
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing)
            
            Text("Avatar: The Way of Water")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.ui.primaryText)
                .padding(.top, 8)
            
            Text("Action, Adventure")
                .foregroundColor(Color.ui.secondaryText)
        }
        .frame(width: 175)
    }
}

struct ShowCellView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCellView()
            .preferredColorScheme(.dark)
    }
}
