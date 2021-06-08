//
//  EnvelopModel.swift
//  App
//
//  Created by ggamangmuri on 2021/06/08.
//

import Foundation

struct EnvelopeModel{
    
    var isClicked: Bool = false
    
    mutating func firstClick(){
        self.isClicked = !self.isClicked
    }
    
    
}
