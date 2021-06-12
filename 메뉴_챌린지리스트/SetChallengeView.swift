//
//  SetChallengeView.swift
//  Challenge
//
//  Created by thingzoo on 2021/06/12.
//

import SwiftUI

struct SetChallengeView: View {
    @ObservedObject var viewModel = ChallengeListViewModel()
    var challenge: Challenge
    @State private var alertTime = Date()
    @Binding var isShowingSet: Bool
    
    func whatTime(date: Date) -> (Int, Int) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        return (components.hour!, components.minute!)
    }
    
    func setNotification(title: String, hour: Int, minute: Int) {
        let manager = LocalNotificationManager()
        manager.requestPermission()
        manager.addNotification(title: title+"할 시간이에요~!")
        manager.scheduleNotifications(hour: hour, minute: minute)
    }
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("알림 시간 선택", selection: $alertTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                
            }
            .navigationTitle("챌린지 설정")
            .navigationBarItems(leading: cancel, trailing: save)
        }
    }
    
    var save: some View {
        Button("저장") {
            let (h, m) = whatTime(date: alertTime)
//            print("\(h) \(m)")
            self.setNotification(title: challenge.title, hour: h, minute: m)
            self.isShowingSet = false
        }
    }
    
    var cancel: some View {
        Button("취소") {
            self.isShowingSet = false
        }
    }
    
}
