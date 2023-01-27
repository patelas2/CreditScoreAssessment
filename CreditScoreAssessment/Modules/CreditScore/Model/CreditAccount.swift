//
//  CreditAccount.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/26/22.
//

/// MARK: - CreditAccount
struct CreditAccount: Codable, Equatable {
    let accountIDVStatus: String?
    let creditReportInfo: CreditReportInfo?
    let dashboardStatus: String?
    let personaType: String?
    let augmentedCreditScore: Int?
}
