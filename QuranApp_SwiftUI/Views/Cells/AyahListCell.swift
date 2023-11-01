//
//  AyahListCell.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 31/10/23.
//

import SwiftUI

struct AyahListCell: View {
    
    let ayah: Ayah
    
    var body: some View {
        
        HStack(alignment: .top){
            
            Text ("\(ayah.numberInSurah))")
                .fontWeight(.semibold)
                .foregroundColor(.brandPrimaryC)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(ayah.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.brandPrimaryC)
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(10)
                    
            }
            .padding(.top)
        }
    }
}

#Preview {
    AyahListCell(ayah: MockData.sempleAyah)
}
