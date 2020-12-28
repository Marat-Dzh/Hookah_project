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
    private let db = Firestore.firestore()
    private let storageImage = Storage.storage()
    private var arrayDictsMenuItem = [[String : Any]]()
    private var arrayMenuPictures = [String : URL]()
}

extension BookingInteractor: BookingInteractorInput{
    func addToBasket() {}
    fileprivate func delay(_ delay: Double, clouser: @escaping () ->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(600)) {
            clouser()
        }
    }
    func getCatalog() {
        //getting catalog from firebase database
        let docRef = self.db.collection("products").document("teas").collection("brandTea")
        let gsReference = self.storageImage.reference(forURL: "gs://hookahproject.appspot.com/images")
        let imageFolderRef = gsReference.child("teas")
        //        let imageRef = gsReference.child("teas/lemontea.jpg")
        imageFolderRef.listAll { (StorageListResult, Error) in
            if let error = Error{
                print(error)
            } else {
                for ref in StorageListResult.items{
                    ref.downloadURL { (URL, Error) in
                        if let error = Error {
                            print("URL problem: \(error)")
                        } else {
                            self.arrayMenuPictures[ref.name] = URL
                        }
                    }
                }
            }
        }
        docRef.getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.arrayDictsMenuItem.append(document.data())
                }
            }
        }
        delay(0.1){
            print("arrayMenuPictures:   \(self.arrayMenuPictures)")
            print("arrayMenuPictures COUNT:   \(self.arrayMenuPictures.count)")
            self.output?.makeMenuArray(arrayDicts: self.arrayDictsMenuItem, images: self.arrayMenuPictures)
        }

    }
}

//                let arrayMenuPicturesRef = StorageListResult.items.map({$0})
//                let arrayMenuPicturesNameRef = StorageListResult.items.map({$0.name})
//                self.arrayMenuPicturesName = arrayMenuPicturesNameRef
//                for item in arrayMenuPicturesRef{
//                    item.getData(maxSize: 1*1024*1024) { (data, error) in
//                        if let error = error{
//                            print(error)
//                        } else {
//                            let pic = UIImage(data: data!)
//                            self.arrayMenuPictures.append(pic!)
//                        }
//                    }
//                }


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
