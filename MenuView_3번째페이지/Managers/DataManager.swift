//
//  DataManager.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import Foundation

protocol DataManagerProtocol {
    func fetchChallengeList(includingFavorite: Bool) -> [Challenge]
    func addChallenge(title: String, isFavorite:Bool)
    func toggleIsFavorite(for challenge: Challenge)
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()

    private var challenges = [Challenge]()

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

    func fetchChallengeList(includingFavorite: Bool = true) -> [Challenge] {
        // 모든 챌린지 또는 즐겨찾기 챌린지 반환, 기본값은 모든 챌린지
        includingFavorite ? challenges : challenges.filter { $0.isFavorite }
    }

    func addChallenge(title: String, isFavorite: Bool) {
        let challenge = Challenge(title: title, isFavorite: isFavorite)
        challenges.insert(challenge, at: 0)
    }

    func toggleIsFavorite(for challenge: Challenge) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }){
            challenges[index].isFavorite.toggle()
        }
    }
}
