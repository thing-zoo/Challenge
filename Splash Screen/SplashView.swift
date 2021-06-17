//
//  SplashView.swift
//  Challenge
//
//  Created by thingzoo on 2021/06/18.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                MainView(viewModel: MainViewModel())
            } else {
                Image("Default")
                Text("일상챌린지")
                    .font(.custom("SeoulNamsanB", size: 40))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
