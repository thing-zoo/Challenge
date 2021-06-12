//
//  MainViewModel.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var systemChallenges = [String]()
    @Published var daily : String = "none"
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared){
        systemChallenges = ["하늘보기", "산책하기", "책 한 권 읽기", "달 사진 찍기"]
        self.dataManager = dataManager
        daily = self.contentOfChallenge()
    }
    
    @Published private var model: MainModel = MainViewModel.create()
    static func create() -> MainModel {
        return MainModel()
    }
    
    func contentOfChallenge() -> String {
        return systemChallenges.randomElement() ?? "none"
    }
    
    func isItClicked() -> Bool {
        return self.model.isClicked
    }
    
    // MARK: - Intent(s)
    func firstClick(){
        model.firstClick()
    }
    func addFavorChallenges(title: String){
        dataManager.addChallenge(title: title, status: 2)
    }

}
