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
    private var user = [[String: Any]]()
    
}

extension ReserveInteractor: ReserveInteractorInput {
    fileprivate func delay(delay: Double, clouser: @escaping () ->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            clouser()
        }
    }
    func reserveTime(dateString: String, numGuest: String){
        //принимает данные от резерва в какую-то струкутру
        //output?.didFinish()
        let uid = Auth.auth().currentUser?.uid
        let docRef = self.db.collection("users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.user.append(document.data()!)
            } else {
                print("Document does not exist")
            }
        }
        delay(delay: 3) {
            self.db.collection("reserves").document(uid!).setData([
                "date": dateString,
                "guests": numGuest,
                "name": self.user.first!["fio"] ?? "no name",
                "phone": self.user.first!["phoneNumber"] ?? "no phone",
                "confirmation": false,
                "uid": uid!
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
}
