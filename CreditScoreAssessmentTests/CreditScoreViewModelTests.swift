//
//  CreditScoreViewModelTests.swift
//  CreditScoreAssessmentTests
//
//  Created by Ashish Patel on 12/28/22.
//

import XCTest
@testable import CreditScoreAssessment

class CreditScoreViewModelTests: XCTestCase {
    
    var serviceUnderTest: CreditScoreViewModel!
    var mockCreditScoreRepo = MockCreditScoreRepository()
    
    override func setUp() {
        super.setUp()
        serviceUnderTest = CreditScoreViewModel(mockCreditScoreRepo)
    }
    
    override func tearDown() {
        serviceUnderTest = nil
        super.tearDown()
    }
    
    func testPerformFetchCreditScoreForSuccessResponse() async {
        mockCreditScoreRepo.response = .success
        await self.serviceUnderTest.performFetchCreditScore()
        let state = self.serviceUnderTest.state
        switch state {
        case .idle, .loading: break
        case .success(let loadedViewModel):
            XCTAssertNotNil(loadedViewModel.creditReportData)
        case .failed(_):
            XCTFail("Fail")
        }
    }
    
    func testPerformFetchCreditScoreForError() async {
        mockCreditScoreRepo.response = .error
        await self.serviceUnderTest.performFetchCreditScore()
        let state = self.serviceUnderTest.state
        switch state {
        case .idle, .loading: break
        case .success(_):
            XCTFail("Fail")
        case .failed(let errorViewModel):
            XCTAssertNotNil(errorViewModel)

        }
    }
}
