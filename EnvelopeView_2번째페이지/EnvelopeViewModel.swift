//
//  EnvelopeViewModel.swift
//  App
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

class EnvelopeViewModel: ObservableObject {
    @Published private var model: EnvelopeModel = EnvelopeViewModel.create()
    static func create() -> EnvelopeModel {
        return EnvelopeModel()
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


