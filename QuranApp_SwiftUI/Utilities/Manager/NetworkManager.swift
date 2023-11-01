//
//  NetworkManager.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 25/10/23.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let dataUrl = "https://api.alquran.cloud/v1/quran/quran-uthmani"
    
    private init() {}
    
    func getData() async throws -> DataResponse {
        
        guard let url = URL(string: dataUrl) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(DataResponse.self, from: data)
        } catch {
            throw APError.invalidData
        }
    }
}
