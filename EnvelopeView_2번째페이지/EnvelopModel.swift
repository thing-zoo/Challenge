//
//  EnvelopModel.swift
//  App
//
//  Created by ggamangmuri on 2021/06/08.
//

import Foundation

struct EnvelopeModel{
    
    var content: String
    var isClicked: Bool = false
    
    init(){
        content = "content" // DB 연동
    }
    
   
    
    mutating func firstClick(){
        self.isClicked = !self.isClicked
    }
    
    
}
