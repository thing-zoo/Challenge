//
//  Challenge.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import Foundation

struct Challenge:Identifiable{
    var id = UUID()
    var title : String
    var isFavorite = false
    //var inProgress = false
    var beginDate = Date()
    var endDate = Date()
    var alert = Date()
}
