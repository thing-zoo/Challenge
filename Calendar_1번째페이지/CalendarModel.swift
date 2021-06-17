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
//            self.parent.selectedDate = date
            self.parent.date_challenge = [Challenge]()
            
//            print("touch calendar")
            let calendar = Calendar.current
            let beginDate_format = DateFormatter()
            beginDate_format.dateFormat = "yyyy-MM-dd"

            let selectDate = calendar.date(byAdding: .hour, value : 9, to: date)! // 캘린더 선택 날짜를 0시로 다시 조정.
            // ex) 2021-06-13 선택 시 )) 2021-06-12 15:00:00 -> 2021-06-13 00:00:00
            print("\(selectDate)")
            
            for challenge in viewModel.challenges {
                let sel_start = calendar.dateComponents([.day], from: challenge.beginDate, to: selectDate).day!
                let finish_sel = calendar.dateComponents([.day], from: selectDate, to: challenge.endDate).day!
                
                let begin = calendar.date(byAdding: .hour, value: 9, to:challenge.beginDate)!
                let end = calendar.date(byAdding: .hour, value: 9, to: challenge.endDate)!
                
                let sel_start_2 = calendar.dateComponents([.day], from: begin, to: selectDate).day!
                let finish_sel_2 = calendar.dateComponents([.day], from: selectDate, to: end).day!
                
                print("sel_start : \(sel_start_2), finish_sel : \(finish_sel_2)")
                
                // 시작 날짜가 선택 날짜보다 이르거나 같아야 하며, 끝 날짜가 선택 날짜보다 늦거나 같아야 한다.
                
                /*
                if(sel_start_2 >= 0 && finish_sel_2 >= 0){  // 선택 날짜가 챌린지의 기간 안에 있는 지 확인.
                    self.parent.date_challenge!.append(challenge)
                }*/
                
                // 18 ~
//                if(calendar.date(byAdding: .day, value: 1, to: date)! >= challenge.beginDate){
//                    self.parent.date_challenge!.append(challenge)
//                }
                // ~ 18
//                if(date <= challenge.endDate){
//                    self.parent.date_challenge!.append(challenge)
//                }
                
                if(calendar.date(byAdding: .day, value: 1, to: date)! >= challenge.beginDate && date <= challenge.endDate){
                    self.parent.date_challenge!.append(challenge)
                }
                
//                if(begin >= 0 && end >= 0){
//                    self.parent.date_challenge!.append(challenge)
//                }
            }
            
            for challenge in selectDate_challenge {
                print("\(challenge.title)")}
            
            /*
            let calendar = Calendar.current
            let selectFormatter = DateFormatter()
            selectFormatter.dateFormat = "yyyy-MM-dd"
            
            selectDate = selectFormatter.date(from: selectFormatter.string(from: date))!
            
            print("선택 날짜 : \(selectDate)") // 날짜가 선택되었는지 test
            
            selectDate_challenge.removeAll() // 배열 만들기 전에 모든 원소 삭제.
            
            for challenge in viewModel.challenges { // selectDate_challenge array 완성 시키기.
                let s = selectFormatter.date(
                    from: selectFormatter.string(from:challenge.startDate))!
                let f = selectFormatter.date(from: selectFormatter.string(from: challenge.finishDate))!
//                print("제목 : \(challenge.title), 시작 날짜: \(s) , 종료 날짜 : \(f)")
                let sel_start = calendar.dateComponents([.day], from: s, to: selectDate).day!
                // 시작 날짜와 선택 날짜와 비교하여 출력.(test) to - from 로 계산하는 듯.
                let finish_sel = calendar.dateComponents([.day], from: selectDate, to: f).day!
//                print("sel_start = \(sel_start), finish_sel = \(finish_sel)")
                
                if(sel_start >= 0 && finish_sel >= 0){ // 선택 날짜가 챌린지의 기간 안에 있는 지 확인.
                    selectDate_challenge.append(challenge)
                }
            }
            for challenge in selectDate_challenge {
                print("\(challenge.title)")} */
            //objectWillChange.send()
            }
        }
    

      func makeCoordinator() -> Coordinator {
        Coordinator(self)
      }
}
