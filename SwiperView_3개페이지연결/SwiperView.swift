//
//  SwiperView.swift
//  App
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

struct TitlePage: View{
    var title: String
    
    var body: some View {
        Text(title)
    }
}

struct SwiperView: View {
    
    var controllers: [UIHostingController<AnyView>]
    let viewArray: Array<AnyView> = [AnyView(CalendarView()), AnyView(EnvelopeView(viewModel: EnvelopeViewModel())), AnyView(MenuView())]
    
    init(){
        self.controllers = self.viewArray.map { view in UIHostingController(rootView: view)}
    }
    
    var body: some View {
        VStack{
            PageViewController(controllers: self.controllers, paging: PageControl(page:0))
            //PageControl(page:0)
        }
    }
}
