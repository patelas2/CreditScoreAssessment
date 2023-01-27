//
//  NetworkManager.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation
import UIKit
import Utilities

/// MARK: - NetworkManager for bakend communication
public protocol NetWorkManagerProtocol {
    func request<T: Decodable>(endpoint: APIURL,
                               parameters: Encodable?) async throws -> T
}

public struct NetWorkManager: NetWorkManagerProtocol {
    
    public init() {}
    
    fileprivate func checkNetworkConnection() throws {
        guard Reachability.isConnectedToNetwork() else {
            throw APIError.noInternet
        }
    }
    
    public func request<T: Decodable>(endpoint: APIURL,
                                      parameters: Encodable?) async throws -> T {
        
        let session = URLSession(configuration: .default)
        
        try checkNetworkConnection()
        
        guard let urlComponents = URLComponents.init(string: endpoint.getURL()), let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        let (data, httpResponse) = try await session.data(from: url)
        
        guard let httpResponse = httpResponse as? HTTPURLResponse, httpResponse.hasValidResponseCode() else {
            throw APIError.invalidResponse
        }
        do {
            return try CustomDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.invalidResponse
        }
    }
}
