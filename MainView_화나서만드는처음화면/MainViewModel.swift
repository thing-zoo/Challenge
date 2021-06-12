//
//  MainViewModel.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published private var model: MainModel = MainViewModel.create()
    static func create() -> MainModel {
        return MainModel()
    }
    
    func contentOfChallenge() -> String {
        return self.model.content
    }
    
    func isItClicked() -> Bool {
        return self.model.isClicked
    }
    
    // MARK: - Intent(s)
    func firstClick(){
        model.firstClick()
    }
}
