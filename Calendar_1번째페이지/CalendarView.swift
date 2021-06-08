//
//  ContentView.swift
//  swiftUI_calendar
//
//  Created by 박다민 on 2021/05/24.
//  Copyright © 2021 박다민. All rights reserved.
//

import SwiftUI


struct CalendarView: View {
    
    var body : some View {
        VStack{
            Calendar()
            HStack{
                //List 삽입
                List{
                    test_challenge(name: "밤 하늘 촬영하기")
                    test_challenge(name: "책 한 권 읽기")
                    test_challenge(name: "아침 일찍 기상하기")
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct test_challenge: View {
    var name: String
    
    var body: some View {
        Text("\(name)")
    }
}
