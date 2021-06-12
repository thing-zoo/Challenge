//
//  SubView.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

struct SlideMenuView: View {
    
    var body: some View {
        //VStack(alignment: .leading) {
            List {
                NavigationLink("즐겨찾기", destination: ChallengeFavorListView().navigationTitle("즐겨찾기"))
                NavigationLink("챌린지 리스트", destination: ChallengeListView().navigationTitle("챌린지 리스트"))
                NavigationLink("커뮤니티", destination: Text("커뮤니티"))
                
            }//.navigationTitle("Back")
            /*
            .foregroundColor(.gray)
            .padding(.top, 100)
            HStack {
                Image(systemName: "folder")
                    .imageScale(.large)
                Text("챌린지 리스트")
                    .font(.headline)
            }
            .foregroundColor(.gray)
            .padding(.top, 30)
            HStack {
                Image(systemName: "person")
                    .imageScale(.large)
                Text("커뮤니티")
                    .font(.headline)
            }
            .foregroundColor(.gray)
            .padding(.top, 30)
            Spacer()
 */
        //}
        //.padding(.top)
    }
}

struct ChallengeContentView: View {
    
    var content: String
    
    init(_ cont:String){
        self.content = cont
    }
    var body: some View {
        Text(content)
    }
}

struct EnvelopeView: View {
    var viewModel: MainViewModel
    
    init(_ viewModel: MainViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View{
        VStack{
            Text("오늘의 챌린지가 도착했습니다.")
            Button(action:{viewModel.firstClick()}){
                ButtonBack()
            }
        }
        .navigationTitle("일상챌린지")
        .navigationBarTitle("Back")
        .padding()
    }
}

struct ButtonBack: View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray)
                .frame(width: 200, height: 150)
            Image(systemName: "heart.fill")
                .font(.system(size:80))
                .foregroundColor(Color.pink)
        }
    }
}
