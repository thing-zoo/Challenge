//
//  MainView.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @State var showMenu: Bool = false
    //@State var calClicked: Bool = false
    
    var body: some View{
        
        let drag = DragGesture().onEnded{
            if $0.translation.width < -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
        }
        
        return NavigationView{
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    if viewModel.isItClicked() {
                        //ChallengeContentView(viewModel.contentOfChallenge())
                        EnvelopeOpenView(self.viewModel)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: self.showMenu ? -geometry.size.width/2 : 0)
                            .disabled(self.showMenu ? true : false)

                    } else {
                        EnvelopeView(self.viewModel)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: self.showMenu ? -geometry.size.width/2 : 0)
                            .disabled(self.showMenu ? true : false)
                    }
                    if self.showMenu {
                        SlideMenuView()
                            .navigationTitle("menu")
                            .gesture(drag)
                            .frame(width: geometry.size.width/2)
                            .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                            .transition(.move(edge: .trailing))
                    }
                }
                
            }
            .navigationBarTitle("일상챌린지", displayMode: .inline)
            .navigationBarItems(leading: calButton(show: self.$showMenu, destination: CalendarView()), trailing: (Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
            }){
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            }))
        }.navigationTitle("일상챌린지")
    }
}

struct calButton<Destination: View>: View {
    @Binding var show: Bool
    var destination: Destination
    @State var isActive: Bool = false
    
    init(show: Binding<Bool>, destination: Destination){
        _show = show
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: self.destination, isActive: self.$isActive) {
            Button(action:{
                self.isActive = true
                self.show = false
            }){
                Image(systemName: "calendar")
            }
           
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
