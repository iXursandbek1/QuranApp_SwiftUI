//
//  SwiftUIView.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 26/10/23.
//

import SwiftUI

struct SurahListCell: View {
    
    let surah: Surah
    
    var body: some View {
        HStack(alignment: .top) {
            
            VStack() {
                Text ("\(surah.number))")
                    .fontWeight(.semibold)
                    .foregroundColor(.brandPrimaryC)
            }
            
            VStack(alignment: .leading) {
                Text (surah.englishName)
                    .fontWeight(.semibold)
                    .foregroundColor(.brandPrimaryC)
                    
                
                Text (surah.englishNameTranslation)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.brandPrimaryC)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(surah.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("\(surah.revelationType.rawValue)")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    SurahListCell(surah: MockData.sempleSurah)
}
