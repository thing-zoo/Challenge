//
//  MockDataManager.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import Foundation


class MockDataManager {

    private var challenges = [Challenge]()
    
    init() {
        challenges = [
            Challenge(id: UUID(), title: "하늘 사진 찍기", isFavorite: true),
            Challenge(id: UUID(), title: "운동 1시간 하기", isFavorite: false),
            Challenge(id: UUID(), title: "책 1챕터 읽기", isFavorite: false),
            Challenge(id: UUID(), title: "달 사진 찍기", isFavorite: true),
            Challenge(id: UUID(), title: "일찍 일어나기", isFavorite: true),
        ]
    }
}

// MARK: - DataManagerProtocol
extension MockDataManager: DataManagerProtocol {
    func addChallenge(title: String, isFavorite: Bool) {
        let challenge = Challenge(title: title, isFavorite:isFavorite)
        challenges.insert(challenge, at: 0)
    }
    
    func fetchChallengeList(includingFavorite: Bool = true) -> [Challenge] {
        // 모든 챌린지 또는 즐겨찾기 챌린지 반환, 기본값은 모든 챌린지
        includingFavorite ? challenges : challenges.filter { $0.isFavorite }
    }
    
    func toggleIsFavorite(for challenge: Challenge) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }){
            challenges[index].isFavorite.toggle()
        }
    }
}
