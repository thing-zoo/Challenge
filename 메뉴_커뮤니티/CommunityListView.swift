//
//  CommunityListView.swift
//  challenge
//
//  Created by myeong on 2021/05/21.
//

import SwiftUI

struct CommunityListView: View {
    var viewModel: MainViewModel
    var Community: [CommunityElement]
    @State var click: Bool = false
    
    init(viewModel: MainViewModel){
        self.viewModel = viewModel
        self.Community = viewModel.dataManager.fetchCommunityList()
    }
    
    var body: some View {
        let width = UIScreen.main.bounds.width/4
        let layout = [
            GridItem(.adaptive(minimum: width))
        ]
        ScrollView{
            LazyVGrid(columns: layout, content: {
                ForEach(0..<Community.count) { index in
                    let element = Community[index]
                    //let image = element.getImage()
                    //let content = element.getTitle()
                    let imageElement = Image(uiImage: element.getImage()!)
                    Button(action:{
                        self.click = true
                    }){
                        imageElement
                            .resizable()
                            .frame(width: width, height: width, alignment: .center)
                            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    }.sheet(isPresented: self.$click, content: {
                        sheetView(Community[index], text: "인증기록")
                            .navigationBarTitle(Text("인증기록"), displayMode: .inline)
                    })
                }
            })
        }
    }
}

struct CommunityListView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityListView(viewModel: MainViewModel())
    }
}
