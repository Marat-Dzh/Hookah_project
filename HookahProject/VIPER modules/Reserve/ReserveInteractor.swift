//
//  ReserveInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import Foundation
import Firebase
import FirebaseFirestore


final class ReserveInteractor {
    weak var output: ReserveInteractorOutput?
    
    private let db = Firestore.firestore()
    
    
}

extension ReserveInteractor: ReserveInteractorInput {
    func reserveTime(dateString: String, numGuest: String){
        //принимает данные от резерва в какую-то струкутру
        //output?.didFinish()
        self.db.collection("reserves").document("User").setData([
            "date": dateString,
            "guests": numGuest,
            "name": "User",
            "phone": "777777777777"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        
        print("dateString: \(dateString)")
    }
}
