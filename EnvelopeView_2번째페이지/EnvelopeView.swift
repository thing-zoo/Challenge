//
//  EnvelopeView.swift
//  page
//
//  Created by ggamangmuri on 2021/05/25.
//

import SwiftUI



struct EnvelopeView: View {
    @ObservedObject var viewModel: EnvelopeViewModel// = EnvelopeViewModel()
    
    var body: some View{
        if viewModel.isItClicked() {
            Text("challenge")
                .font(Font.largeTitle)
                .padding(15)
        } else {
            VStack{
                Text("오늘의 챌린지가 도착했습니다.")
                Button(action:{viewModel.firstClick()}){
                    ButtonBack()
                }
            }
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


struct pre: PreviewProvider {
    static var previews: some View {
        EnvelopeView(viewModel: EnvelopeViewModel())
    }
}
