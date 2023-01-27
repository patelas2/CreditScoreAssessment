//
//  MockDataGenerator.swift
//  CreditScoreAssessmentTests
//
//  Created by Ashish Patel on 12/28/22.
//

import Foundation
import Networking

@testable import CreditScoreAssessment

final class MockDataGenerator {
    static func mockCreditAccount() throws -> CreditAccount {
        do {
            let data = try getMockCreditAccount()
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(CreditAccount.self, from: data)
            return response
        } catch {
            throw APIError.unknownError
        }
    }
    
    static func getMockCreditAccount() throws -> Data {
        guard let path = Bundle.main.path(forResource: "AccountData", ofType: "json") else { throw APIError.invalidURL }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            throw APIError.unknownError
        }
    }
    
    static func getGenerateError(messsage: String) -> NSError? {
        return NSError(domain: "com.example.error",
                       code: 0,
                       userInfo: [NSLocalizedDescriptionKey: messsage])
    }
}
