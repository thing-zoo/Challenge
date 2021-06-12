//
//  CalendarView.swift
//  swiftUI_calendar
//
//  Created by 박다민 on 2021/05/24.
//  Copyright © 2021 박다민. All rights reserved.
//

import SwiftUI

class selectUserDate : ObservableObject {
    @Published var selectDate: Date = Date()
}

struct CalendarView: View {
//    @ObservedObject var select: selectUserDate
    var selectDate: Date = Date()
    
    @ObservedObject var viewModel = ChallengeListViewModel()
    @State var date_challenge : [Challenge]?
//    var calendar_model = CalendarModel(selectedDate: $userData.date)
    var body : some View {
        VStack {
            CalendarModel(date_challenge: $date_challenge)
            HStack{
                //List 삽입
                List(date_challenge ?? viewModel.challenges){ challenge in
                    Text(challenge.title)
                }
            }
        }
    }
    
    init() {
        date_challenge = [Challenge]()
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
