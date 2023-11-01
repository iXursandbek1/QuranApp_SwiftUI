//
//  Holy_Quran_View.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 20/10/23.
//

import SwiftUI

struct SurahsListView: View {
    
    @StateObject var vm = SurahListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List{
                    ForEach(vm.surah, id: \.number) { surah in
                        NavigationLink(destination: AyahListView(surah: surah,
                                                                 isShowingAyahView: $vm.isShowingAyahView)) {
                            SurahListCell(surah: surah)
                        }
                    }
                }
                .navigationTitle("Quran")
                .listStyle(.plain)
            }
            .task {
                vm.getData()
            }
            .blur(radius: vm.isShowingAyahView ? 20 : 0)
            
            if vm.isLoading {
                LoadingView()
            }
        }
        .alert(item: $vm.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    SurahsListView()
}
