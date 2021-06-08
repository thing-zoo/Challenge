//
//  NewChallengeViewModel.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import Foundation
import Combine

protocol NewChallengeViewModelProtocol {
    func addNewChallenge(title: String)
    func addNewChallengeInFavor(title: String)
}

final class NewChallengeViewModel: ObservableObject{
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared){
        self.dataManager = dataManager
    }
}

extension NewChallengeViewModel: NewChallengeViewModelProtocol{
    func addNewChallenge(title: String) {
        //let challenge = Challenge(id: UUID(), title: title, isFavorite: Bool)
        dataManager.addChallenge(title: title, isFavorite: false)
    }
    func addNewChallengeInFavor(title: String) {
        //let challenge = Challenge(id: UUID(), title: title, isFavorite: Bool)
        dataManager.addChallenge(title: title, isFavorite: true)
    }
}
