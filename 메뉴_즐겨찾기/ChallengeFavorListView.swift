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
    @State private var isShowingSet = false
    
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }) {
            Image(systemName: "plus")
        }
    }
    
    var body: some View {
        List(viewModel.challenges){ challenge in
            Button(action: {
                isShowingSet = true
            }) {
                HStack{
                    ChallengeFavorRow(challenge: challenge)
                    Button(action: {
                        self.viewModel.toggleIsFavorite(for: challenge)
                    }) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }

                }
                .sheet(isPresented: $isShowingSet) {
                    SetFavoriteView(challenge: challenge, isShowingSet: $isShowingSet)
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
