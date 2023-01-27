//
//  CreditScoreDetailsView.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/27/22.
//

import SwiftUI

struct CreditScoreDetailsView: View {
    var viewModel: CreditScoreDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                CustomCreditScoreView
                CustomCreditChangesView
                CustomCreditInsightsView
            }
            .navigationBarTitle(viewModel.navigationTitle, displayMode: .inline)
        }
    }
    
    private var CustomCreditScoreView: some View {
        VStack(spacing: 2) {
            Text("\(Int(viewModel.creditScore))")
                .textDefaultSettings(size: .extraXXLargeFont, weight: .light, color: .primaryColor)
            Text(viewModel.outOfText)
                .textDefaultSettings(size: .largeFont, weight: .regular, color: .blackColor)
        }
    }
    
    private var CustomCreditChangesView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.changesTitle)
                .textDefaultSettings(size: .largeFont, weight: .bold)
            if viewModel.hasShortTermDebt || viewModel.shortTermDebtChange != 0 {
                Text("\(viewModel.shortTermDebtTitle) £\(viewModel.shortTermDebtValue)")
                    .textDefaultSettings()

                Text(viewModel.getShortTermChangedByText())
                    .textDefaultSettings()
            }
            if viewModel.hasLongTermDebt || viewModel.longTermDebtChange != 0 {
                Text("\(viewModel.longTermDebtTitle) £\(viewModel.longTermDebtValue)")
                    .textDefaultSettings()
                Text(viewModel.getLongTermChangedByText())
                    .textDefaultSettings()
            }
        }
        .setBackgroundProperties()
    }
    
    private var CustomCreditInsightsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.insightsTitle)
                .textDefaultSettings(size: .largeFont, weight: .bold)
            Text(viewModel.missedPaymentsText)
                .textDefaultSettings()
            Text(viewModel.defaultedText)
                .textDefaultSettings()
        }
        .setBackgroundProperties()
    }
}
