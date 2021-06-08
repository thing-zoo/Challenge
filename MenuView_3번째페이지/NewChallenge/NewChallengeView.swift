//
//  NewChallengeView.swift
//  challenge
//
//  Created by myeong on 2021/05/19.
//

import SwiftUI


struct NewChallengeView: View{
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: NewChallengeViewModel
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var title = ""
    
    private var isAddButtonDisabled: Bool {
            title.isEmpty
        }
        
    private var addButtonColor: Color {
        isAddButtonDisabled ? .gray : .green
    }
    
    var body: some View{
        VStack{
            Spacer()
            TextField("Enter Name", text:$title)
            Spacer()
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    // cancel action
                }) {
                    Text("Cancel")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.green)

                Button(action: {
                    if !self.isAddButtonDisabled {
                        self.viewModel.addNewChallengeInFavor(title: self.title)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    // add action
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(addButtonColor)
                .disabled(isAddButtonDisabled)
            }
        }
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut(duration: keyboard.duration))
    }
}

struct NewChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        NewChallengeView(viewModel: NewChallengeViewModel())
    }
}
