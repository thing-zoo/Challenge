//
//  ChallengeFavorListViewModel.swift
//  challenge
//
//  Created by myeong on 2021/05/20.
//

import Foundation
import Combine

final class ChallengeFavorListViewModel: ObservableObject{
    @Published var challenges = [Challenge]()
    @Published var showFavorite = false
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared){
        self.dataManager = dataManager
        fetchChallenges()
    }
}

extension ChallengeFavorListViewModel: ChallengeListViewModelProtocol{
    func fetchChallenges() {
        challenges = dataManager.fetchChallengeList(status: 2)
    }
    
    func toggleIsFavorite(for challenge: Challenge) {
        dataManager.toggleIsFavorite(for: challenge)
        fetchChallenges()
    }
    func setDate(for challenge: Challenge, begin: Date, end: Date) {
        dataManager.setDate(for: challenge, begin: begin, end: end)
    }
}
