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
                NavigationLink("커뮤니티", destination:
                    CommunityListView().navigationTitle("커뮤니티"))
                
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

struct EnvelopeView:View {
    var viewModel: MainViewModel
    init(_ viewModel: MainViewModel){
        self.viewModel = viewModel
    }
    var body: some View{
        VStack{
            Text("오늘의 챌린지가 도착했습니다.").font(.custom("SeoulNamsanB", size: 20))
            Button(action:{viewModel.firstClick()}){
                ButtonBack()
            }
        }
        .navigationTitle("일상챌린지")
        .navigationBarTitle("Back")
        .padding()
    }
}

struct EnvelopeOpenView: View {
    var viewModel: MainViewModel
    @State private var complete = false
    @State private var addFavor = false

    init(_ viewModel: MainViewModel){
        self.viewModel = viewModel
    }

    var body: some View{
        let content = viewModel.daily
        let width = UIScreen.main.bounds.width

        ZStack{
            Image("envelope")
                .resizable()
                .frame(width: width*0.6, height: width*0.9, alignment: .center)
            
            VStack{
                ZStack{
                    Text(content)
                        .font(.custom("SeoulNamsanB", size: 35))
//                        .font(Font.largeTitle)
                        .padding(30)
                        .offset(x: 0.0, y: width*0.2)
                        
                    
                    if complete{
                        Image("good")
                            .resizable()
                            .frame(width: width*0.3, height: width*0.3)
                            .opacity(0.9)
                            .offset(x: 0, y: width*0.2)
                    }
                    
                }
                .padding()
                HStack{
                    Button(action: {
                        if !addFavor{
                            self.addFavor = true
                            viewModel.addFavorChallenges(title: content)
                        }
                    }, label: {
                        VStack{
                            Text("즐겨찾기")
                            Image(systemName: addFavor ? "star.fill" : "star")
                        }
                    })
                    .padding()
                    
                    Button(action: {
                        self.complete = true
                    }, label: {
                        Text("완료하기")
                    })
                    .padding()
                }
                .font(.custom("SeoulNamsanB", size: 20))
                .minimumScaleFactor(0.5)
                .offset(x: 0.0, y: width*0.1)
            }
            .navigationTitle("일상챌린지")
            .navigationBarTitle("Back")
            .padding()
        }
        
    }
}

struct ButtonBack: View {
    
    var body: some View{
        let swidth = UIScreen.main.bounds.width
        let w = CGFloat(swidth*0.6)
        let h = CGFloat(swidth*0.6)
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray)
                .frame(width: w, height: h)
            Image(systemName: "heart.fill")
                .font(.system(size:w*0.4))
                .foregroundColor(Color.pink)
        }
    }
}


struct EnvelopeOpenView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeOpenView(MainViewModel())
    }
}
