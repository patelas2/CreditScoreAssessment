//
//  CreditScoreRepositoryTests.swift
//  CreditScoreAssessmentTests
//
//  Created by Ashish Patel on 12/28/22.
//

import XCTest
@testable import CreditScoreAssessment

class CreditScoreRepositoryTests: XCTestCase {
    
    var serviceUnderTest: CreditScoreRepositoryImplementation!
    var mockNetworkManager = MockNetWorkManagerProtocol()
    
    override func setUp() {
        super.setUp()
        serviceUnderTest = CreditScoreRepositoryImplementation(netWorkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        super.tearDown()
        XCTAssertTrue(mockNetworkManager.verify())
        mockNetworkManager.resetCounts()
        serviceUnderTest = nil
    }
    
    func testCreditScoreService_WhenGiveSuccess() async throws {
        do {
            mockNetworkManager.expectPerformRequest(response: try MockDataGenerator.getMockCreditAccount(), error: nil)
            let response = try await serviceUnderTest.fetchCreditScore()
            XCTAssertNotNil(response)
        } catch {
            XCTFail("API Call Fail")
        }
    }
    
    func testCreditScoreService_WhenGiveFail() async throws {
        do {
            let expectedErrorMessage = "Unable to find records"
            let exptedError = MockDataGenerator.getGenerateError(messsage: expectedErrorMessage)
            mockNetworkManager.expectPerformRequest(response: nil, error: exptedError)
            _ = try await self.serviceUnderTest.fetchCreditScore()
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
