//
//  MockCreditScoreRepository.swift
//  CreditScoreAssessmentTests
//
//  Created by Ashish Patel on 12/28/22.
//

import Foundation
import Networking

@testable import CreditScoreAssessment

enum Response {
    case success
    case error
}

final class MockCreditScoreRepository: CreditScoreRepository {
    
    var response: Response = .success
    
    func fetchCreditScore() async throws -> CreditAccount {
        switch response {
        case .success:
            if !(Reachability.isConnectedToNetwork()) {
                throw APIError.noInternet
            }
            do {
                let creditAccount = try MockDataGenerator.mockCreditAccount()
                return creditAccount
            } catch {
                throw error
            }
            
        case .error:
            throw APIError.invalidResponse
        }
    }
}
