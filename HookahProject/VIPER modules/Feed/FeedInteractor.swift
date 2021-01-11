//
//  FeedInteractor.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage


final class FeedInteractor{
    weak var output: FeedInteractorOutput?
    private let storageImage = Storage.storage()
    private var arrayImagesStories = [URL]()
}

extension FeedInteractor: FeedInteractorInput{
    func fetchNewsFromFB() {
        self.output?.updateNews()
    }
    
    func fetchStoriesFromFB() {
        let gsReference = self.storageImage.reference(forURL: "gs://hookahproject.appspot.com/images")
        let imageFolderRef = gsReference.child("stories")
        imageFolderRef.listAll { (StorageListResult, Error) in
            if let error = Error {
                print(error)
            } else {
                for ref in StorageListResult.items {
                    ref.downloadURL { (URL, Error) in
                        if let error = Error {
                            print("URL problem: \(error)")
                        } else {
                            self.arrayImagesStories.append(URL!)
                        }
                    }
                }
                self.output?.updateStories(images: self.arrayImagesStories)
            }
        }
    }
}
