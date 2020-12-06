//
//  UserProfileInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import Foundation
import Firebase

final class UserProfileInteractor {
    var output: ReserveInteractorOutput?
    var userInfo: UserInfo?
    init(info: UserInfo?) {
        userInfo = info
    }
}

extension UserProfileInteractor: UserProfileInteractorInput{
    func getUserInfo() -> UserInfo? {
        return userInfo
    }
    func logout() {
        do{
            try Auth.auth().signOut()
        } catch{
            //nothing
        }
        
    }
}
