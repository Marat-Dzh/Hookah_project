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
        let docRef = self.db.collection("reserves").whereField("confirmation", isEqualTo: false)
        docRef.getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.arrayDictsReserve.append(document.data())
                }
            }
            print("self.arrayDictsReserve ===> \(self.arrayDictsReserve)")
            self.output?.makeReserve(arrayDicts: self.arrayDictsReserve)
        }
    }
    func deleteReserveFromFB() {
        let docRef = self.db.collection("reserves")
        docRef.document("User").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    func changeConfirmationInFB() {
        let docRef = self.db.collection("reserves")
        docRef.document("User").updateData(["confirmation" : true])  { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
