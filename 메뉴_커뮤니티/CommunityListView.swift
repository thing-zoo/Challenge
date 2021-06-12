//
//  CommunityListView.swift
//  challenge
//
//  Created by myeong on 2021/05/21.
//

import SwiftUI

struct CommunityListView: View {
    let images : [Image] = [
        Image("good"), Image("good"),Image("lara"),Image("lara")
    ]
    
    var body: some View {
        let width = UIScreen.main.bounds.width/4
        let layout = [
            GridItem(.adaptive(minimum: width))
        ]
        ScrollView{
            LazyVGrid(columns: layout, content: {
                ForEach(0..<images.count) { imageIdx in
                   images[imageIdx]
                   .resizable()
                   .frame(width: width, height: width, alignment: .center)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
            })
        }
    }
}

struct CommunityListView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityListView()
    }
}
