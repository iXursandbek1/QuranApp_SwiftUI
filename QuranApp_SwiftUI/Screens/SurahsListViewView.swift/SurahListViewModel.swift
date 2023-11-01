//
//  SurahListViewModel.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 26/10/23.
//

import SwiftUI

@MainActor final class SurahListViewModel: ObservableObject {
    
    
    @Published var surah: [Surah] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var selectedSurah: Surah?
    @Published var isShowingAyahView = false


    func getData() {
        isLoading = true
        
        Task {
            do {
                let data = try await NetworkManager.shared.getData()
                surah = data.data.surahs
                isLoading = false
            } catch {
                if let apiError = error as? APError {
                    switch apiError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComeplate:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
