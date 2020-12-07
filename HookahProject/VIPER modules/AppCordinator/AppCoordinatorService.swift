//
//  AppCoordinatorProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 10.11.2020.
//

import Foundation
import FirebaseFirestore

class AppCoordinatorService{
    class func getPersonContext(context: AuthContext) -> UserContext?{
        if context.personType == .unknown {
            return nil
        }
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(context.id)
        var userInfo: UserInfo = UserInfo()
        docRef.getDocument {(document, error)  in
            if let document = document, document.exists {
                userInfo = UserInfo(doc: document)
                print(userInfo.fio)
            } else {
                print("Document does not exist")
            }
        }
        return UserContext(info: userInfo, history: [], orders: [])
    }
    init(){
        
    }
}

