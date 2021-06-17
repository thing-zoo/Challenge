//
//  MainViewModel.swift
//  Challenge
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var systemChallenges = [String]()
    @Published var daily : String = "none"
    @Published private var model: MainModel = MainViewModel.create()
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared){
        systemChallenges = ["하늘보기", "산책하기", "책 한 권 읽기", "달 사진 찍기"]
        self.dataManager = dataManager
        daily = self.contentOfChallenge()
        
        // viewModel 설정
        
        UserDefaults.standard.removeObject(forKey: "today")
        UserDefaults.standard.removeObject(forKey: "isClicked")
        UserDefaults.standard.removeObject(forKey: "completeChall")
        UserDefaults.standard.removeObject(forKey: "completeChall")
        UserDefaults.standard.removeObject(forKey: "faovrChall")
        
        let value = UserDefaults.standard.value(forKey: "isClicked") as? String
        //print(value)
        let today = UserDefaults.standard.value(forKey: "today") as? String
        let completeChall = UserDefaults.standard.value(forKey: "completeChall") as? String
        
        if value != nil && today != nil {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let now = formatter.string(from: Date())
            
            if now != today {
                UserDefaults.standard.removeObject(forKey: "today")
                UserDefaults.standard.removeObject(forKey: "isClicked")
                UserDefaults.standard.removeObject(forKey: "completeChall")
            } else { // 오늘이네
                if value == "true"{ // 오늘의 챌린지 선택 했음
                    model.firstClick()
                    
                    if completeChall == "true" {
                        model.setCompleteChall()
                    }
                }
            }
        }
        
    }
    
    func addCommunity(element: CommunityElement) {
        dataManager.addCommunity(element: element)
    }
    
    func isInfavorList() -> Bool{
        let list = dataManager.fetchChallengeList(status: 2)
        for chall in list {
            if chall.title == daily {
                return true
            }
        }
        return false
    }
    
    static func create() -> MainModel {
        return MainModel()
    }
    
    func contentOfChallenge() -> String {
        return systemChallenges.randomElement() ?? "none"
    }
    
    func isItClicked() -> Bool {
        return self.model.isClicked
    }
    
    func whatIscompleteChall() -> Bool {
        return self.model.completeChall
    }
    
    // community element 관련
    
    func setCertificate(_ element: CommunityElement) {
        self.model.certificate = element
    }
    
    func getCertificate() -> CommunityElement {
        return self.model.certificate
    }
    
    func uploadCertificate() {
        self.model.isThereCertificate = true
    }
    
    func isTherCertificate() -> Bool {
        return self.model.isThereCertificate
    }
    
    // MARK: - Intent(s)
    func firstClick(){
        model.firstClick()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let today = formatter.string(from: Date())
        
        print(model.isClicked)
        print(today)
        
        UserDefaults.standard.setValue(String(model.isClicked), forKey: "isClicked")
        UserDefaults.standard.setValue(today, forKey: "today")
        UserDefaults.standard.setValue(String(model.completeChall), forKey: "completeChall")
    }
    func addFavorChallenges(title: String){
        dataManager.addChallenge(title: title, status: 2)
    }
}
