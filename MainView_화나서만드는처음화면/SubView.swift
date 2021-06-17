//
//  SubView.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

struct SlideMenuView: View {
    
    var viewModel: MainViewModel
    
    init(viewModel: MainViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        //VStack(alignment: .leading) {
            List {
                NavigationLink("즐겨찾기", destination: ChallengeFavorListView().navigationTitle("즐겨찾기"))
                NavigationLink("챌린지 리스트", destination: ChallengeListView().navigationTitle("챌린지 리스트"))
                NavigationLink("커뮤니티", destination:
                                CommunityListView(viewModel: self.viewModel).navigationTitle("커뮤니티"))
                
            }//.navigationTitle("Back")
            /*
            .foregroundColor(.gray)
            .padding(.top, 100)
            HStack {
                Image(systemName: "folder")
                    .imageScale(.large)
                Text("챌린지 리스트")
                    .font(.headline)
            }
            .foregroundColor(.gray)
            .padding(.top, 30)
            HStack {
                Image(systemName: "person")
                    .imageScale(.large)
                Text("커뮤니티")
                    .font(.headline)
            }
            .foregroundColor(.gray)
            .padding(.top, 30)
            Spacer()
 */
        //}
        //.padding(.top)
    }
}

struct EnvelopeView:View {
    var viewModel: MainViewModel
    init(_ viewModel: MainViewModel){
        self.viewModel = viewModel
    }
    var body: some View{
        VStack{
            Text("오늘의 챌린지가 도착했습니다.").font(.custom("SeoulNamsanB", size: 20))
            Button(action:{viewModel.firstClick()}){
                ButtonBack()
            }
        }
        .navigationTitle("일상챌린지")
        .navigationBarTitle("Back")
        .padding()
    }
}

struct EnvelopeOpenView: View {
    var viewModel: MainViewModel
    @State private var complete = false
    @State private var addFavor = false
    @State private var upload = false
    
    var savedChall: String?
    var savedFavor: String?

    init(_ viewModel: MainViewModel){
        self.viewModel = viewModel
        self.savedChall = UserDefaults.standard.value(forKey: "completeChall") as? String
        if self.viewModel.isInfavorList() == true {
            setAddFavor()
        }
    }
    
    func setAddFavor() {
        self.addFavor = true
    }
    
    func checkComplete() -> Bool {
        if savedChall == "true" || complete == true {
            return true
        }
        return false
    }

    var body: some View{
        let content = viewModel.daily
        let width = UIScreen.main.bounds.width

        ZStack{
            Image("envelope")
                .resizable()
                .frame(width: width*0.6, height: width*0.9, alignment: .center)
            
            VStack{
                ZStack{
                    Text(content)
                        .font(.custom("SeoulNamsanB", size: 35))
//                        .font(Font.largeTitle)
                        .padding(30)
                        .offset(x: 0.0, y: width*0.2)
                        
                    
                    if checkComplete() {
                        Image("good")
                            .resizable()
                            .frame(width: width*0.3, height: width*0.3)
                            .opacity(0.9)
                            .offset(x: 0, y: width*0.2)
                    }
                    
                }
                .padding()
                HStack{
                    Button(action: {
                        if !addFavor{
                            self.addFavor = true
                            viewModel.addFavorChallenges(title: content)
                            UserDefaults.standard.setValue(String(self.addFavor), forKey: "favorChall")
                        }
                    }, label: {
                        VStack{
                            Text("즐겨찾기")
                            Image(systemName: addFavor ? "star.fill" : "star")
                        }
                    })
                    .padding()
                    
                    if upload == false {
                        Button(action: {
                            self.complete = true
                            UserDefaults.standard.setValue(String(self.complete), forKey: "completeChall")
                        }, label: {
                            Text("인증하기")
                        })
                        .sheet(isPresented: $complete) {
                            ImagePicker(sourceType: .photoLibrary) { image in
                                let element = CommunityElement(image, title: content);
                                self.viewModel.setCertificate(element) // 오늘의 챌린지 인증완료
                                self.upload = true // 이제 포토 보여줘
                                
                                // 커뮤니티에 업로드
                                self.viewModel.addCommunity(element: element)
                                
                                
                            }
                        }
                        .padding()
                    } else {
                        Button(action: {
                            self.complete = true
                            UserDefaults.standard.setValue(String(self.complete), forKey: "completeChall")
                        }, label: {
                            Text("인증완료")
                        })
                        .sheet(isPresented: $complete) {
                            sheetView(self.viewModel.getCertificate(), text: "인증완료")
                        }
                        .padding()
                    }
                    
                }
                .font(.custom("SeoulNamsanB", size: 20))
                .minimumScaleFactor(0.5)
                .offset(x: 0.0, y: width*0.1)
            }
            .padding()
        }
        
    }
}

struct sheetView: View{
    var certificate: CommunityElement
    var content: String
    
    init(_ element: CommunityElement, text: String){
        self.certificate = element
        self.content = text
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                /*VStack(){
                    Image(systemName: "chevron.compact.down")
                        //.frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
                    Image(systemName: "chevron.compact.down")
                        //.frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
                }
                
                    
                })
                .foregroundColor(.blue)*/
                Image(uiImage: certificate.getImage()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300, height: 300)
                    .padding()
                
                Text(certificate.getTitle())
                    .frame(width: 300, height: 50)
                    .padding()
            }
            .navigationBarTitle(Text(content), displayMode: .inline)
        }
        
    }
}

struct ButtonBack: View {
    
    var body: some View{
        let swidth = UIScreen.main.bounds.width
        let w = CGFloat(swidth*0.6)
        let h = CGFloat(swidth*0.6)
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray)
                .frame(width: w, height: h)
            Image(systemName: "heart.fill")
                .font(.system(size:w*0.4))
                .foregroundColor(Color.pink)
        }
    }
}


struct EnvelopeOpenView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeOpenView(MainViewModel())
    }
}
