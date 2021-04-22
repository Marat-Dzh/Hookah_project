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
    var dictMenuPictures1 = [String : URL]()
}

extension BookingInteractor: BookingInteractorInput{
    func fetchCatalog() {
        let loadingGroup = DispatchGroup()
        
        var isError: Bool = false
        
        var arrayDictsMenuItems: [[String : Any]] = []
        var imageItems: [String : URL] = [:]
        
        loadingGroup.enter()
        fetchDocumentsMenu { result in
            switch result {
            case .success(let data):
                arrayDictsMenuItems = data
            case .failure(let error):
                isError = true
                print("[DEBUG] fetch documents menu error: \(error)")
            }
            
            loadingGroup.leave()
        }
        
        loadingGroup.enter()
        fetchImageMenu { result in
            switch result {
            case .success(let data):
                imageItems = data
            case .failure(let error):
                isError = true
                print("[DEBUG] fetch image menu error: \(error)")
            }
            
            loadingGroup.leave()
        }
        
        loadingGroup.notify(queue: .main) { [weak self] in
            if isError {
                self?.output?.didReciveError()
            } else {
                self?.output?.didLoadObjects(images: imageItems, data: arrayDictsMenuItems)
            }
        }
        
        //   }
    }
}

extension BookingInteractor {
    func fetchDocumentsMenu(completion: @escaping (Result<[[String : Any]], Error>) -> Void) {
        var arrayDictsMenuItems: [[String : Any]] = []
        
        let docRef = self.db.collection("products").document("teas").collection("brandTea")
        docRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
                for document in querySnapshot!.documents {
                    arrayDictsMenuItems.append(document.data())
                }
                
                completion(.success(arrayDictsMenuItems))
            }
        }
    }
    func fetchImageMenu(completion: @escaping (Result<[String : URL], Error>) -> Void) {
        let gsReference = self.storageImage.reference(forURL: "gs://hookahproject.appspot.com/images")
        let imageFolderRef = gsReference.child("teas")
        //        let imageRef = gsReference.child("teas/lemontea.jpg")
        
        var imageItems: [String : URL] = [:]
        
        imageFolderRef.listAll { (StorageListResult, Error) in
            if let error = Error{
                completion(.failure(error))
                print(error)
            } else {
                let group = DispatchGroup()
                for ref in StorageListResult.items{
                    group.enter()
                    ref.downloadURL() { (url, error) in
                        if let error = error {
                            print("URL problem: \(error)")
                        } else {
                            if let url = url {
                                imageItems[ref.name] = url
                            }
                        }
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                    completion(.success(imageItems))
                }
            }
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
