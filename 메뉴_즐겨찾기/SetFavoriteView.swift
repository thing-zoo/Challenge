//
//  SetFavoriteView.swift
//  Challenge
//
//  Created by thingzoo on 2021/06/12.
//

import SwiftUI

struct SetFavoriteView: View {
    var challenge: Challenge
    
    @ObservedObject var viewModel = ChallengeFavorListViewModel()
    var begin = Date()
    @State var endDate = Date()
    @State var alertTime = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    
    var body: some View {
        Form {
            DatePicker("기간 선택", selection: $endDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
            
            DatePicker("알림 시간 선택", selection: $alertTime, displayedComponents: .hourAndMinute)
            Button(action: {
                viewModel.setDate(for: challenge, begin: begin, end: endDate, alert: alertTime)
            }, label: {Text("저장")})
        }
        
    }
}

struct ContentView: View {
    
    @State private var wakeUp = Date()
    
    var body: some View {
            //텍스트를 "" = empty로 지정할 수 있다.
        DatePicker("날짜를 선택하세요", selection: $wakeUp)  //여기까지가 기본 code
           //Mark: 피커 스타일 (wheel)
            .datePickerStyle(WheelDatePickerStyle())
    }
}
//struct SetFavoriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetFavoriteView()
//    }
//}
