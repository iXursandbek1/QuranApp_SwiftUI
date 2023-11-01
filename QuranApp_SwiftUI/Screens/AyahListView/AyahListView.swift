//
//  AyahListView.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 31/10/23.
//

import SwiftUI

struct AyahListView: View {
    
    let surah: Surah
    @Binding var isShowingAyahView: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                List() {
                    ForEach(surah.ayahs, id: \.numberInSurah) { ayah in
                        AyahListCell(ayah: ayah)
                    }
                }
            }
        }
        .navigationTitle(surah.englishName)
        .listStyle(.grouped)
    }
}

#Preview {
    AyahListView(surah: MockData.sempleSurah, isShowingAyahView: .constant(true))
}
