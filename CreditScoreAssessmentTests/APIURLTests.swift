//
//  APIURLTests.swift
//  CreditScoreAssessmentTests
//
//  Created by Ashish Patel on 12/28/22.
//

import XCTest
import Networking

@testable import CreditScoreAssessment

class APIURLTests: XCTestCase {
    
    override func setUpWithError() throws {
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testGetCreditScoreURL() throws {
        let url = APIURL.getCreditScore.getURL()
        XCTAssertEqual(url, "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")
    }
    
}
