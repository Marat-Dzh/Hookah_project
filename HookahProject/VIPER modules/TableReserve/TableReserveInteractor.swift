//
//  TableTableReserveInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import Foundation
import Firebase
import FirebaseFirestore

final class TableReserveInteractor {
    weak var output: TableReserveInteractorOutput?
    
    private let db = Firestore.firestore()
    private var arrayDictsReserve = [[String:Any]]()
    
}

extension TableReserveInteractor: TableReserveInteractorInput{
    func getReserve(){
//        let docRef = self.db.collection("reserves").whereField("confirmation", isEqualTo: false)
        let docRef = self.db.collection("reserves")
        docRef.getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let querySnapshot = querySnapshot else { return }
                for document in querySnapshot.documents {
                    self.arrayDictsReserve.append(document.data())
                }
            }
            self.output?.makeReserve(arrayDicts: self.arrayDictsReserve)
            self.arrayDictsReserve.removeAll()
        }
    }
    func deleteReserveFromFB(uid: String) {
        let docRef = self.db.collection("reserves")
        docRef.document(uid).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    func changeConfirmationInFB(uid: String,  confirmation: Bool) {
        let docRef = self.db.collection("reserves")
        docRef.document(uid).updateData(confirmation ? ["confirmation" : true] : ["confirmation" : false])  { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
