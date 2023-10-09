//
//  VSLoadingView.swift
//
//
//  Created by Kevin Hermawan on 09/10/23.
//

import SwiftUI

struct VSLoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
}

struct VSLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VSLoadingView()
        }
    }
}
