//
//  ChallengeListViewModel.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import SwiftUI
import Combine

protocol ChallengeListViewModelProtocol {
    var challenges: [Challenge] {get}
    var showFavorite: Bool {get set}
    func fetchChallenges()
    func toggleIsFavorite(for challenge: Challenge)
    
}

final class ChallengeListViewModel: ObservableObject{
    @Published var challenges = [Challenge]()
    @Published var showFavorite = true
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared){
        self.dataManager = dataManager
        fetchChallenges()
    }
}

extension ChallengeListViewModel: ChallengeListViewModelProtocol{
    func fetchChallenges() {
        challenges = dataManager.fetchChallengeList(includingFavorite: showFavorite)
    }
    
    func toggleIsFavorite(for challenge: Challenge) {
        dataManager.toggleIsFavorite(for: challenge)
        fetchChallenges()
    }
}
