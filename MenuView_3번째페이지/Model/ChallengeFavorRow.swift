//
//  ChallengeRow.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import SwiftUI

struct ChallengeFavorRow : View{
    var challenge: Challenge
    
    var body: some View{
        HStack{
            Text(challenge.title)
            Spacer()
            Image(systemName: challenge.isFavorite ? "star.fill" : "star")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
        }
    }
}

struct ChallengeFavorRow_Previews: PreviewProvider{
    static var previews: some View{
        Group { 
            ChallengeFavorRow(challenge: Challenge(title: "하늘 사진 찍기"))
            ChallengeFavorRow(challenge: Challenge(title: "거울보고 웃기", isFavorite: true))
        }
        .previewLayout(.fixed(width: 300, height: 44))
    }
}
