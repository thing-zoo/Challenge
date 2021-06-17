//
//  CommunityElement.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/18.
//

import SwiftUI

class CommunityElement {
    private var image: UIImage?
    private var title: String
    
    init(_ image: UIImage?, title: String) {
        self.image = image
        self.title = title
    }
    
    init(){
        self.image = nil
        self.title = ""
    }
    
    func getImage() -> UIImage? {
        return self.image
    }
    
    func getTitle() -> String {
        return self.title
    }
}

