//
//  CalendarModel.swift
//  swiftUI_calendar
//
//  Created by 박다민 on 2021/05/26.
//  Copyright © 2021 박다민. All rights reserved.
//

import SwiftUI
import FSCalendar

struct CalendarModel: UIViewRepresentable {
    @Binding var date_challenge : [Challenge]?
//    @Binding var selectedDate : Date?
    typealias UIViewType = FSCalendar
    
      func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.appearance.weekdayTextColor = UIColor.orange
        calendar.appearance.headerTitleColor = UIColor.systemBlue
        calendar.appearance.titleWeekendColor = UIColor.red
        calendar.scrollDirection = .horizontal
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        return calendar
      }

      func updateUIView(_ uiView: FSCalendar, context: Context) {
        
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource, ObservableObject{
        @ObservedObject var viewModel = ChallengeListViewModel()
        @Published var selectDate_challenge = [Challenge]()
        var parent : CalendarModel
        
        init(_ calendar: CalendarModel) {
            self.parent = calendar
        }
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) { // 캘린더에서 날짜 선택 마다 호출되는 함수
            self.parent.date_challenge = [Challenge]()
            
            let calendar = Calendar.current
            
            for challenge in viewModel.challenges {

                if(calendar.date(byAdding: .day, value: 1, to: date)! >= challenge.beginDate && date <= challenge.endDate){
                    self.parent.date_challenge!.append(challenge)
                }
            }
            
            for challenge in selectDate_challenge {
                print("\(challenge.title)")}
            }
        }
    
      func makeCoordinator() -> Coordinator {
        Coordinator(self)
      }
}
