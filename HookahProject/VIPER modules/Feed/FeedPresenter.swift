//
//  FeedPresenter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import Foundation
import UIKit

final class FeedPresenter{
    weak var view: FeedViewInput?
    weak var moduleOutput: LoginModuleOutput?
    private let router: FeedRouterInput
    private let interactor: FeedInteractorInput
    
    private var arrayImageStories = [UIImage]()
    
    init(_ router:FeedRouterInput,_ interactor:FeedInteractorInput){
        self.interactor = interactor
        self.router = router
    }
}

extension FeedPresenter: FeedModuleInput{
    func getNews() {
         
    }
    
    func getStocks() {
         
    }
    
    
}

extension FeedPresenter: FeedViewOutput{
    func fetchImageStories() {
        
    }
    
    func fetchNews() {
        
    }
}

extension FeedPresenter: FeedInteractorOutput{
    func updateStories(images: [URL]) {
//        for image in images {
//
//        }
        //self.view?.setStories(storiesList: images)
    }
    
    func updateNews() {
         
    }
}
