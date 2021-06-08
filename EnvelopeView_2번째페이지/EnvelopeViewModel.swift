//
//  EnvelopeViewModel.swift
//  App
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

class EnvelopeViewModel: ObservableObject {
    @Published var systemChallenges = [String]()
    init(){
        systemChallenges = ["하늘보기", "산책하기", "책 한 권 읽기", "달 사진 찍기"]
    }
    
    @Published private var model: EnvelopeModel = EnvelopeViewModel.create()
    static func create() -> EnvelopeModel {
        return EnvelopeModel()
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
}


