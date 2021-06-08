//
//  Calendar.swift
//  swiftUI_calendar
//
//  Created by 박다민 on 2021/05/26.
//  Copyright © 2021 박다민. All rights reserved.
//

import SwiftUI
import FSCalendar

struct Calendar: UIViewRepresentable {
      typealias UIViewType = FSCalendar
    
      func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.appearance.weekdayTextColor = UIColor.orange
        calendar.appearance.headerTitleColor = UIColor.red
        calendar.appearance.titleWeekendColor = UIColor.red
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        return calendar
      }

      func updateUIView(_ uiView: FSCalendar, context: Context) {}
      class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {}

      func makeCoordinator() -> Coordinator {
        return Coordinator()
      }
}
