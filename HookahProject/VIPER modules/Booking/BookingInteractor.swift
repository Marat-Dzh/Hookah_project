//
//  BookingInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

final class BookingInteractor{
    weak var output: BookingInteractorOutput?
    let db = Firestore.firestore()
    let storageImage = Storage.storage()
    
}

extension BookingInteractor: BookingInteractorInput{
    func addToBasket() {
        //
    }
    
    func getCatalog() {
        //getting catalog from firebase database
        let docRef = self.db.collection("products").document("teas").collection("brandTea")
        let gsReference = self.storageImage.reference(forURL: "gs://hookahproject.appspot.com/images/teas")
        let imageRef = gsReference.child("lemontea.jpg")
        var arrayDicts1 = [[String : Any]]()
        docRef.getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) =====> \(document.data())")
                    arrayDicts1.append(document.data())
                }
            }
            //print("arrayDict: \(arrayDicts)")
            
        }
        
        imageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("Error getting image: \(error)")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.output?.makeMenu(arrayDicts: arrayDicts1, image: image!)
            }
            
        }
        
    }
}

//db.collection("shoppingList").getDocuments(){
//    querySnapshot, error in
//
//    if let error = error {
//        print("error loading documents \(error.localizedDescription)")
//    } else{
//        self.shoppingArray = querySnapshot!.documents.flatMap({ShoppingListItem(dictionary: $0.data())})
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//
//}
