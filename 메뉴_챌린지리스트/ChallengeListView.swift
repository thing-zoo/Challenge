//
//  ChallengeListView.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import SwiftUI

struct ChallengeListView: View {
    @ObservedObject var viewModel = ChallengeListViewModel()
    @State private var isShowingSet = false
    
    var body: some View{
        Button(action: {
            isShowingSet = true
        }) {
            List(viewModel.challenges){ challenge in
                Text(challenge.title)
                    .font(.custom("SeoulNamsanB", size: 22))
            }.onAppear{
                self.viewModel.fetchChallenges()
            }
        }
        .sheet(isPresented: $isShowingSet) {
            //
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
