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
        GeometryReader { gp in
            VStack {
                CalendarModel(date_challenge: $date_challenge)
                    .frame(width: gp.size.width, height: gp.size.height*0.62)
                HStack{
                    List(date_challenge ?? viewModel.challenges) { challenges in
                        NavigationLink(
                            destination: DetailChallenge(challenge: challenges)){
                            Text(challenges.title)
                        }
                    }
                }.frame(width: gp.size.width, height: gp.size.height*0.38)
            }
        }
    }
    
    init() {
        date_challenge = [Challenge]()
    }
    
}

struct DetailChallenge : View {
    let challenge : Challenge
    let dateformat = DateFormatter()
    var body: some View {
        VStack(spacing: 30){
            Text("\(challenge.title)")
            HStack{
                Text("기간")
                Text("\(dateformat.string(from: challenge.beginDate)) ~ \(dateformat.string(from: challenge.endDate))")
            }
        }
    }
    
    init(challenge : Challenge){
        self.challenge = challenge
        dateformat.dateFormat = "yyyy-MM-dd"
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
