//
//  UserProfileInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 30.11.2020.
//

import Foundation
import Firebase
import FirebaseStorage

final class UserProfileInteractor {
    weak var output: UserProfileInteractorOutput?
    var userInfo: UserInfo?
    private let storageImage = Storage.storage()
    let currentUser = Auth.auth().currentUser?.uid
    init(info: UserInfo?) {
        userInfo = info
    }
}

extension UserProfileInteractor: UserProfileInteractorInput{
    func uploadImageInFB(image: Data) {
        let gsReference = self.storageImage.reference(forURL: "gs://hookahproject.appspot.com/images")
        let imageFolderRef = gsReference.child("photoProfile")
        let profileImageRef = imageFolderRef.child("\(String(describing: self.currentUser)).jpg")
        
        let uploadMetaData = StorageMetadata()
        uploadMetaData.contentType = "image/jpeg"
        
        profileImageRef.putData(image)
        
    }
    
    func downloadImageFromFB() {
        let gsReference = self.storageImage.reference(forURL: "gs://hookahproject.appspot.com/images")
        let imageFolderRef = gsReference.child("photoProfile")
        let imageRef = imageFolderRef.child("\(String(describing: self.currentUser)).jpg")
        imageRef.downloadURL { (url, error) in
            if let error = error {
              print(error)
            } else {
                if let url = url {
                    self.output?.downloadURLImageProfile(url: url)
                }
            }
        }
    }
    
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
