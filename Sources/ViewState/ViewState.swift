//
//  ViewState.swift
//
//
//  Created by Kevin Hermawan on 28/09/23.
//

import SwiftUI

public enum ViewState {
    case loading
    case empty
    case error
}

extension ViewState: Equatable {
    public static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading), (.empty, .empty), (.error, .error):
            return true
        default:
            return false
        }
    }
}

extension View {
    @ViewBuilder
    public func when<V: View>(_ state: ViewState?, is: ViewState, content: () -> V) -> some View {
        if state == `is` {
            content()
        } else {
            self
        }
    }
}
