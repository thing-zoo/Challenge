//
//  DataManager.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import Foundation
import SwiftUI

protocol DataManagerProtocol {
    func fetchChallengeList(status:Int) -> [Challenge]
    func addChallenge(title: String, status: Int)
    func toggleIsFavorite(for challenge: Challenge)
    func setDate(for challenge: Challenge, begin: Date, end: Date)
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()

//    private var challenges = [Challenge]()
    private var beingChallenges = [Challenge]()
    private var favorChallenges = [Challenge]()
    private var communityList = [CommunityElement]()

    private init() {
        //실행시 데이터가 나타나는 것을 보고 싶다면 주석 처리 지울것
        //preivew는 MockDataManager가 있기 때문에 보이는 것임.
//        challenges = [
//            Challenge(id: UUID(), title: "하늘 사진 찍기", isFavorite: true),
//            Challenge(id: UUID(), title: "운동 1시간 하기", isFavorite: false),
//            Challenge(id: UUID(), title: "책 1챕터 읽기", isFavorite: false),
//            Challenge(id: UUID(), title: "달 사진 찍기", isFavorite: true),
//            Challenge(id: UUID(), title: "일찍 일어나기", isFavorite: true),
//        ]
    }
}

// MARK: - DataManagerProtocol
extension DataManager: DataManagerProtocol {

    func fetchChallengeList(status : Int) -> [Challenge] {
        switch(status){
        case 1:
            return beingChallenges
        case 2:
            return favorChallenges
        default:
            return [Challenge]()
        }
    }

    func addChallenge(title: String, status : Int) {
        let challenge = Challenge(title: title)
        switch status {
        case 1:
            beingChallenges.insert(challenge, at: 0)
        case 2:
            favorChallenges.insert(challenge, at: 0)
        default:
            return
        }
    }

    func addChallenge(challenge : Challenge){
        beingChallenges.insert(challenge, at: 0)
    }
    func toggleIsFavorite(for challenge: Challenge) {
        if let index = favorChallenges.firstIndex(where: { $0.id == challenge.id }){
            favorChallenges.remove(at: index)
        }
    }
    
    func setDate(for challenge: Challenge, begin: Date, end: Date) {
        let ch = Challenge(id: challenge.id, title: challenge.title, beginDate: begin, endDate: end)
        addChallenge(challenge: ch)
    }
    
    func addCommunity(_ image: UIImage?, title: String) {
        self.communityList.append(CommunityElement(image, title: title))
    }
}
