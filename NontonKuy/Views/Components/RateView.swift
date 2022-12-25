//
//  RateView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct RateView: View {
    let value: Double
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
        
        Text(String(format: "%.1f", value))
            .foregroundColor(Color.ui.primaryText)
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(value: 7)
            .preferredColorScheme(.dark)
    }
}
