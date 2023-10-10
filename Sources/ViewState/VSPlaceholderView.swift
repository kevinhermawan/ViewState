//
//  VSPlaceholderView.swift
//
//
//  Created by Kevin Hermawan on 09/10/23.
//

import SwiftUI

public struct VSPlaceholderView<Content: View>: View {
    private let title: String
    private let description: String
    private let content: () -> Content
    
    public init(title: String, description: String, content: @escaping () -> Content = { EmptyView() }) {
        self.title = title
        self.description = description
        self.content = content
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(title)
                .font(.headline)
            
            Text(description)
                .multilineTextAlignment(.center)
            
            content()
                .padding(.vertical)
        }
        .frame(maxWidth: .infinity)
    }
}

struct VSEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VSPlaceholderView(
                title: "No Data Available",
                description: "There's nothing here to display at the moment."
            )
        }
    }
}
