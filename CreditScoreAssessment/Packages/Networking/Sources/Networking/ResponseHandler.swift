//
//  ResponseHandler.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation


public extension HTTPURLResponse {
    func hasValidResponseCode() -> Bool {
        return (200...299).contains(self.statusCode)
    }
}
