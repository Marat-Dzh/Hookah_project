//
//  ChangeScoresInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import Foundation
import Firebase
import FirebaseFirestore

class ChangeScoresInteractor {
    weak var output: ChangeScoresInteractorOutput?
    private let db = Firestore.firestore()
    private var docId : String = ""
    
}

extension ChangeScoresInteractor: ChangeScoresInteractorInput {
    
    
    func changeScoresInFB(cardInt: Int, scoresInt: Int) {
        self.db.collection("users").whereField("cardId", isEqualTo: cardInt).getDocuments  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                guard let querySnapshot = querySnapshot else { return }
                for document in querySnapshot.documents {
                    self.db.collection("users").document(document.documentID).updateData(["numberOfPoints" : scoresInt]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                }
                
            }
        }
    }
    func plusScoresInFB(cardInt: Int, scoresInt: Int) {
        print("PLUS cardInt ==> \(cardInt), scoresInt ==> \(scoresInt)")
    }
}
