//
//  CreditScoreRepository.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation
import Networking
import Utilities

/// MARK: - CreditScore repository
protocol CreditScoreRepository {
    func fetchCreditScore() async throws -> CreditAccount
}

struct CreditScoreRepositoryImplementation: CreditScoreRepository {
    
    private var netWorkManager: NetWorkManagerProtocol!
    
    init(netWorkManager: NetWorkManagerProtocol = NetWorkManager()) {
        self.netWorkManager = netWorkManager
    }
    
    func fetchCreditScore() async throws -> CreditAccount {
        return try await netWorkManager.request(endpoint: .getCreditScore, parameters: nil)
    }
}
