//
//  VSLoadingView.swift
//
//
//  Created by Kevin Hermawan on 09/10/23.
//

import SwiftUI

public struct VSLoadingView: View {
    public init() {}
    
    public var body: some View {
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
