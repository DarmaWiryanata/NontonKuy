//
//  SeparatorView.swift
//  NontonKuy
//
//  Created by Darma Wiryanata on 25/12/22.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 5, height: 5)
            .foregroundColor(Color.ui.primaryText)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
