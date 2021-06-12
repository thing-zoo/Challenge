//
//  ChallengeFavorListView.swift
//  challenge
//
//  Created by myeong on 2021/05/20.
//

import SwiftUI

struct ChallengeFavorListView: View {
    @ObservedObject var viewModel = ChallengeFavorListViewModel()
    @State private var isShowingAddNew = false
    
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }) {
            Image(systemName: "plus")
        }
    }

    var body: some View {
        NavigationView {
            List(viewModel.challenges){ challenge in
                HStack{
                    ChallengeFavorRow(challenge: challenge)
                    Button(action: {
                        self.viewModel.toggleIsFavorite(for: challenge)
                    }) {
                        Image(systemName: challenge.isFavorite ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .padding(0.0)
        .navigationBarItems(trailing: addNewButton)
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchChallenges()
        }) {
            NewChallengeView(viewModel: NewChallengeViewModel())
        }
        .onAppear{
            self.viewModel.fetchChallenges()
        }

    }
}

struct ChallengeFavorListView_Previews: PreviewProvider{
    static var previews: some View{
        var view = ChallengeFavorListView()
        view.viewModel = ChallengeFavorListViewModel(dataManager: MockDataManager())
        return view
    }
}
