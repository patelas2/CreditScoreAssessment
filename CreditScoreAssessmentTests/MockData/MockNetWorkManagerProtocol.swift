//
//  MockNetWorkManagerProtocol.swift
//  CreditScoreAssessmentTests
//
//  Created by Ashish Patel on 12/28/22.
//

import Foundation
import Networking
@testable import CreditScoreAssessment

final class MockNetWorkManagerProtocol: NSObject {
    private var configureServiceClientCount = 0
    private var expectedResponse: Data?
    private var expectedError: NSError?
    func expectPerformRequest(response: Data?,
                              error: NSError?) {
        self.expectedResponse = response
        self.expectedError = error
        self.configureServiceClientCount += 1
    }
    func resetCounts() {
        configureServiceClientCount = 0
    }
    func verify() -> Bool {
        return configureServiceClientCount == 0
    }
}

extension MockNetWorkManagerProtocol: NetWorkManagerProtocol {
    func request<T>(endpoint: APIURL, parameters: Encodable?) async throws -> T where T : Decodable {
        configureServiceClientCount -= 1
        guard expectedError == nil else { throw expectedError! }
        return try JSONDecoder().decode(T.self, from: expectedResponse!)
    }
}
