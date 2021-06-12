//
//  MainModel.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import Foundation

struct MainModel {
    var isClicked: Bool = false

    mutating func firstClick(){
        self.isClicked.toggle()
    }
}
