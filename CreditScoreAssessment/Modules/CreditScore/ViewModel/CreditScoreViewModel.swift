//
//  CreditScoreViewModel.swift
//  CreditScoreAssessment
//
//  Created by Ashish Patel on 12/27/22.
//

import Foundation
import SwiftUI
import Utilities

/// MARK: - CreditScore ViewModel
final class CreditScoreViewModel: ObservableObject {
    @Published var state: LoadingState<LoadedViewModel> = .idle
    @Published var showErrorAlert = false
    private let repository: CreditScoreRepository
    
    init(_ repository: CreditScoreRepository = CreditScoreRepositoryImplementation()) {
        self.repository = repository
    }
    
    public struct LoadedViewModel: Equatable {
        static func == (lhs: CreditScoreViewModel.LoadedViewModel, rhs: CreditScoreViewModel.LoadedViewModel) -> Bool {
            lhs.id == rhs.id
        }
        let id: String
        let creditReportData: CreditReportInfo
    }
    
    func performFetchCreditScore() async {
        do {
            let response = try await self.repository.fetchCreditScore()
            await MainActor.run { [weak self] in
                if let creditReportInfo = response.creditReportInfo {
                    self?.state = .success(.init(id: UUID().uuidString, creditReportData: creditReportInfo))
                } else {
                    self?.showErrorAlert = true
                    self?.state = .failed(ErrorViewModel(message: ErrorMessage.invalidResponse.rawValue)) }
            }
        } catch {
            await MainActor.run { [weak self] in
                self?.showErrorAlert = true
                self?.state = .failed(ErrorViewModel(message: error.localizedDescription)) }
        }
    }
    
    func calculateProgessValue(score: Double,
                               maxScore: Double) -> Double {
        return (score/maxScore)
    }
}
