//
//  AppEnvironment.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation

/// AppEnvironment
enum Environment {
    case production
}

final class AppEnvironment {
    
    static let shared = AppEnvironment()
    var environmentType: Environment = .production
}
