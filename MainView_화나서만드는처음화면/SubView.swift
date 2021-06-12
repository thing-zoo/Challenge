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

struct EnvelopeView:View {
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

struct EnvelopeOpenView: View {
    var viewModel: MainViewModel
    @State private var complete = false
    @State private var addFavor = false

    init(_ viewModel: MainViewModel){
        self.viewModel = viewModel
    }

    var body: some View{
        let content = viewModel.daily
        
        ZStack{
            Image(systemName: "heart.fill")
                .font(.system(size:80))
                .foregroundColor(Color.pink)
                .rotationEffect(.degrees(180))
                .offset(CGSize(width: 0.0, height: -125.0))
            MomentumArrow()
                .fill(Color(UIColor.lightGray))
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color(red: 0.96, green: 0.96, blue: 0.96))
                .frame(width: 180, height: 140)
                .offset(CGSize(width: 0.0, height: 30.0))
            VStack{
                ZStack{
                    Text(content)
                        .font(Font.largeTitle)
                        .padding(30)
                    
                    if complete{
                        Image("good")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .opacity(0.9)
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
                        HStack{
                            Text("즐겨찾기").minimumScaleFactor(0.5)
                            Image(systemName: addFavor ? "star.fill" : "star")
                        }
                    })
                    .padding(5)
                    
                    
                    Button(action: {
                        self.complete = true
                    }, label: {
                        Text("완료하기")
                    })
                    .padding(5)
                }
            }
            .navigationTitle("일상챌린지")
            .navigationBarTitle("Back")
            .padding()
        }
        
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

struct MomentumArrow: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let swidth = UIScreen.main.bounds.width/2
        let sheight = UIScreen.main.bounds.height/2
        let w = CGFloat(100.0)
        let h = CGFloat(75.0)
// Triangle
        path.move(to: CGPoint(x: swidth-w, y: sheight-h))
        path.addLine(to: CGPoint(x: swidth, y: sheight-2*h))
        path.addLine(to: CGPoint(x: swidth+w, y: sheight-h))

        // Rect
        path.move(to: CGPoint(x: swidth-w, y: sheight-h))
        path.addLine(to: CGPoint(x: swidth-w, y: sheight+h))
        path.addLine(to: CGPoint(x: swidth+w, y: sheight+h))
        path.addLine(to: CGPoint(x: swidth+w, y: sheight-h))
        path.addLine(to: CGPoint(x: swidth-w, y: sheight-h))
        
        return path
    }
    
}
