//
//  CommunityListView.swift
//  challenge
//
//  Created by myeong on 2021/05/21.
//

import SwiftUI

struct CommunityListView: View {
//    let items = Array(1...1000).map({"Element \($0)"})
    let images : [Image] = [
        Image("good"), Image("good")
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
