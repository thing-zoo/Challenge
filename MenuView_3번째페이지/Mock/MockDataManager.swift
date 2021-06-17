//
//  MockDataManager.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import Foundation


class MockDataManager {

    private var beingChallenges = [Challenge]()
    private var favorChallenges = [Challenge]()
    
    init() {
        beingChallenges = [
            Challenge(id: UUID(), title: "하늘 사진 찍기"),
            Challenge(id: UUID(), title: "운동 1시간 하기"),
            Challenge(id: UUID(), title: "책 1챕터 읽기"),
            Challenge(id: UUID(), title: "달 사진 찍기"),
            Challenge(id: UUID(), title: "일찍 일어나기"),
        ]
        favorChallenges = [
            Challenge(id: UUID(), title: "하늘 사진 찍기"),
            Challenge(id: UUID(), title: "운동 1시간 하기"),
            Challenge(id: UUID(), title: "책 1챕터 읽기"),
            Challenge(id: UUID(), title: "달 사진 찍기"),
            Challenge(id: UUID(), title: "일찍 일어나기"),
        ]
    }
}

// MARK: - DataManagerProtocol
extension MockDataManager: DataManagerProtocol {
    func fetchCommunityList() -> [CommunityElement] {
        return [CommunityElement]()
    }
    
    
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
    
    func addCommunity(element: CommunityElement) {
        
    }
}
