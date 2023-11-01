//
//  ActivityIndicator.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 26/10/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activeIndeicatorView = UIActivityIndicatorView(style: .large)
        activeIndeicatorView.color = UIColor.brandPrimaryC
        activeIndeicatorView.startAnimating()
        return activeIndeicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
}


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimaryC))
                .scaleEffect(2)
        }
    }
}
