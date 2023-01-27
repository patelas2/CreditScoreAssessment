//
//  APIBaseURL.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation

/// APIBaseURL
enum APIBaseURL: String {
    
    case baseURLLive = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/"
    
    static func getBaseURL() -> String {
        switch AppEnvironment.shared.environmentType {
        case .production:
            return APIBaseURL.baseURLLive.rawValue
        }
    }
}

public enum APIURL {
    case getCreditScore
    case none
    
    public func getURL() -> String {
        let baseURL = APIBaseURL.getBaseURL()
        
        switch self {
        case .getCreditScore:
            return baseURL + "mockcredit/values"
        case .none:
            return ""
        }
    }
}
