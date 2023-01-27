//
//  CreditScoreDetailsViewModel.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/27/22.
//

import Foundation
struct CreditScoreDetailsViewModel {
    
    private let creditReportInfo: CreditReportInfo
    
    let navigationTitle = "creditDetails.title".localized()
    //header
    var creditScore: Int {
        return creditReportInfo.score ?? 0
    }
    
    var outOfText: String {
        let maxScore = String(creditReportInfo.maxScoreValue ?? 0)
        return "dashboard.creditScoreMaximum".localizedWith(maxScore)
    }
    
    //changes
    var changesTitle: String {
        return "creditDetails.changes.title".localized()
    }
    
    var hasShortTermDebt: Bool {
        return creditReportInfo.currentShortTermDebt ?? 0 <= 0
    }
    
    var shortTermDebtTitle: String {
        return "creditDetails.shorttermdebt.title".localized()
    }
    
    var shortTermDebtChangeTitle: String {
        return getShortTermDebtChange()
    }
    
    var shortTermDebtChange: Int {
        return creditReportInfo.changeInShortTermDebt ?? 0
    }
    
    var shortTermDebtValue: Int {
        return creditReportInfo.currentShortTermDebt ?? 0
    }
    
    var longTermDebtTitle: String {
        return "creditDetails.longtermdebt.title".localized()
    }
    
    var longTermDebtChangeTitle: String {
        return getLongTermDebtChange()
    }
    
    var hasLongTermDebt: Bool {
        return creditReportInfo.currentLongTermDebt ?? 0 <= 0
    }
    
    var longTermDebtChange: Int {
        return creditReportInfo.changeInLongTermDebt ?? 0
    }
    
    var longTermDebtValue: Int {
        return creditReportInfo.currentLongTermDebt ?? 0
    }
    
    //insights
    var insightsTitle: String {
        return "creditDetails.insights.title".localized()
    }
    
    var missedPaymentsText: String {
        return getMissedPaymentsText()
    }
    
    var defaultedText: String {
        return getDefaultedText()
    }
    
    //Credit init
    init(creditReportInfo: CreditReportInfo) {
        self.creditReportInfo = creditReportInfo
    }
    
    private func getShortTermDebtChange() -> String {
        let shortTermDebtChange = creditReportInfo.changeInShortTermDebt ?? 0
        if shortTermDebtChange > 0 {
            return "creditDetails.shorttermdebt.increased.text".localized()
        } else if shortTermDebtChange < 0 {
            return "creditDetails.shorttermdebt.decreased.text".localized()
        } else {
            return "creditDetails.shorttermdebt.nochange.text".localized()
        }
    }
    
    private func getLongTermDebtChange() -> String {
        let longTermDebtChange = creditReportInfo.changeInLongTermDebt ?? 0
        if longTermDebtChange > 0 {
            return "creditDetails.longtermdebt.increased.text".localized()
        } else if longTermDebtChange < 0 {
            return "creditDetails.longtermdebt.decreased.text".localized()
        } else {
            return "creditDetails.longtermdebt.nochange.text".localized()
        }
    }
    
    private func getDefaultedText() -> String {
        if creditReportInfo.hasEverDefaulted ?? false {
            if creditReportInfo.monthsSinceLastDefaulted ?? 0 > 1 {
                let months = String(creditReportInfo.monthsSinceLastDefaulted ?? 0)
                return "creditDetails.insights.defaults.pluralmonths.text".localizedWith(months)
            } else {
                return "creditDetails.insights.defaults.onemonth.text".localized()
            }
        } else {
            return "creditDetails.insights.nodefaults.text".localized()
        }
    }
    
    private func getMissedPaymentsText() -> String {
        let monthsSinceLastMissedPayment = creditReportInfo.monthsSinceLastDelinquent ?? 0
        if !(creditReportInfo.hasEverBeenDelinquent ?? false) {
            return "creditDetails.insights.nomissedpayments.text".localized()
        } else if monthsSinceLastMissedPayment > 1 {
            return "creditDetails.insights.missedpayments.pluralmonths.text".localizedWith(monthsSinceLastMissedPayment)
        } else {
            return "creditDetails.insights.missedpayments.onemonth.text".localized()
        }
    }
    
    func getShortTermChangedByText() -> String {
        if shortTermDebtChange != 0 {
            return "\(shortTermDebtChangeTitle) £\(shortTermDebtChange)"
        } else {
            return shortTermDebtChangeTitle
        }
    }
    
    func getLongTermChangedByText() -> String {
        if shortTermDebtChange != 0 {
            return "\(longTermDebtChangeTitle) £\(longTermDebtChange)"
        } else {
            return longTermDebtChangeTitle
        }
    }
}
