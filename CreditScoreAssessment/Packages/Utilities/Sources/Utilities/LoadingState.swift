//
//  LoadingState.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation

/// Loading state
public struct ErrorViewModel: Equatable {
    public let message: String
    public init(message: String) {
        self.message = message
    }
}

public enum LoadingState<T: Equatable>: Equatable {
    case idle
    case loading
    case failed(ErrorViewModel)
    case success(T)
}
