//
//  ContentView.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 20/10/23.
//

import SwiftUI

struct QuranAppTabView: View {
   
    var body: some View {
        TabView {
            SurahsListView()
                .tabItem { Label("Quran", systemImage: "book") }
            
            LessonsList_View()
                .tabItem { Label("Video Lessons", systemImage: "list.and.film") }
        }
    }

}

#Preview {
    QuranAppTabView()
}
