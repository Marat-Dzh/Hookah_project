//
//  UserProfileInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import Foundation
import Firebase

final class UserProfileInteractor {
    var output: UserProfileInteractorOutput?
    var userInfo: UserInfo?
    init(info: UserInfo?) {
        userInfo = info
    }
}

extension UserProfileInteractor: UserProfileInteractorInput{
    func setInfoEntity(info: UserInfo) {
        userInfo = info
    }
    
    func getUserInfo() -> UserInfo? {
        return userInfo
    }
    func logout() {
        do{
            try Auth.auth().signOut()
        }
        catch
        {
            print("Error is --- \(error.localizedDescription)")
            return
        }
        output?.userSignedOut()
    }
}
