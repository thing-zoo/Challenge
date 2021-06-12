//
//  SetFavoriteView.swift
//  Challenge
//
//  Created by thingzoo on 2021/06/12.
//

import SwiftUI

struct SetFavoriteView: View {
    @ObservedObject var viewModel = ChallengeFavorListViewModel()
    var challenge: Challenge
    var begin = Date()
    @State var endDate = Date()
    @State var alertTime = Date()
    @Binding var isShowingSet: Bool
    
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .full
//        return formatter
//    }
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("기간 선택", selection: $endDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                
                DatePicker("알림 시간 선택", selection: $alertTime, displayedComponents: .hourAndMinute)

            }
            .navigationTitle("챌린지 설정")
            .navigationBarItems(leading: cancel, trailing: save)
        }
        
    }
    
    var save: some View {
        Button("저장") {
            viewModel.setDate(for: challenge, begin: begin, end: endDate, alert: alertTime)
            self.isShowingSet = false
        }
    }
    
    var cancel: some View {
        Button("취소") {
            self.isShowingSet = false
        }
    }
    
}
