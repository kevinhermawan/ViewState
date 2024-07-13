//
//  ViewState.swift
//
//
//  Created by Kevin Hermawan on 28/09/23.
//

import SwiftUI

public enum ViewState: Equatable {
    case loading
    case empty
    case success(message: String)
    case error(message: String)
    
    public var successMessage: String? {
        switch self {
        case .success(let message):
            return message
        default:
            return nil
        }
    }
    
    public var errorMessage: String? {
        switch self {
        case .error(let message):
            return message
        default:
            return nil
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
    
    @ViewBuilder
    public func whenSuccess<V: View>(_ state: ViewState?, content: @escaping (String) -> V) -> some View {
        if case .success(let message) = state {
            content(message)
        } else {
            self
        }
    }
    
    @ViewBuilder
    public func whenError<V: View>(_ state: ViewState?, content: @escaping (String) -> V) -> some View {
        if case .error(let message) = state {
            content(message)
        } else {
            self
        }
    }
}
