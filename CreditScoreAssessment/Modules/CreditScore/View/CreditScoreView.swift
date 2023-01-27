//
//  CreditScoreView.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/27/22.
//

import SwiftUI
import Elements

/// MARK: - CreditScoreView
struct CreditScoreView: View {
    
    //Properties
    @State var progessValue: CGFloat = 0.0
    @ObservedObject var viewModel: CreditScoreViewModel
    
    //View Body
    var body: some View {
        let state = viewModel.state
        switch state {
        case .idle:
            Color.clear.onAppear(perform: loadData)
        case .loading:
            ProgressView()
                .navigationBarTitle("dashboard.title".localized(), displayMode: .large)
        case .success(let loadedViewModel):
            NavigationLink(destination: CreditScoreDetailsView(viewModel: CreditScoreDetailsViewModel(creditReportInfo: loadedViewModel.creditReportData))) {
                VStack() {
                    CustomProgressView(currentProgress: Double(loadedViewModel.creditReportData.score ?? 0),
                                       maxProgress:String(loadedViewModel.creditReportData.maxScoreValue ?? 0),
                                       progress: $progessValue)
                    .onAppear() {
                        progessValue = viewModel.calculateProgessValue(score: Double(loadedViewModel.creditReportData.score ?? 0),
                                                                       maxScore: Double(loadedViewModel.creditReportData.maxScoreValue ?? 0))
                    }
                }
                .navigationBarTitle("dashboard.title".localized(), displayMode: .large)
            }
            
        case .failed(let errorViewModel):
            Color.clear.alert(isPresented: $viewModel.showErrorAlert) {
                Alert(
                    title: Text("alert.Error".localized()),
                    message: Text(errorViewModel.message),
                    dismissButton: .default(Text("alert.okButton".localized()))
                )
            }
        }
    }
    
    private func loadData() {
        viewModel.state = .loading
        Task(priority: .userInitiated) {
            await self.viewModel.performFetchCreditScore()
        }
    }
}
