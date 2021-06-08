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
    //var startDate : Date
    //var finishDate : Date
    //var alarm : ??????time을 써야하나?
}
