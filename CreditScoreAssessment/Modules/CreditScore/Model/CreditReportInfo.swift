//
//  CreditReportInfo.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/26/22.
//

/// MARK: - CreditReportInfo
struct CreditReportInfo: Codable, Equatable {
    let score: Int?
    let scoreBand: Int?
    let maxScoreValue: Int?
    let monthsSinceLastDefaulted: Int?
    let monthsSinceLastDelinquent: Int?
    let hasEverDefaulted: Bool?
    let hasEverBeenDelinquent: Bool?
    let percentageCreditUsed: Int?
    let currentShortTermDebt: Int?
    let changeInShortTermDebt: Int?
    let currentLongTermDebt: Int?
    let changeInLongTermDebt: Int?
}
