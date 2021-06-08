//
//  ChallengeListView.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import SwiftUI

struct ChallengeListView: View {
    @ObservedObject var viewModel = ChallengeListViewModel()

    var body: some View{
        List(viewModel.challenges){ challenge in
            Text(challenge.title)
        }
    }
}

struct ChallengeListView_Previews: PreviewProvider{
    static var previews: some View{
        var view = ChallengeListView()
        view.viewModel = ChallengeListViewModel(dataManager: MockDataManager())
        return view
    }
}
