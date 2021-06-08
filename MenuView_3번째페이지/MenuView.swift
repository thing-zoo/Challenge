//
//  ContentView.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import SwiftUI

struct MenuView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.2, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: ChallengeListView()
                                .navigationBarTitle("챌린지 리스트")){
                    Text("챌린지 리스트")
                }
                NavigationLink(destination: ChallengeFavorListView()
                                .navigationBarTitle("즐겨찾기")
                ){
                    Text("즐겨찾기")
                }
                
                NavigationLink(destination: CommunityListView().navigationBarTitle("커뮤니티")){
                    Text("커뮤니티")
                }
            }
            .navigationBarTitle(Text("메뉴"))
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
