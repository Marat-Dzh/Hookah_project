//
//  FeedPresenter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import Foundation

final class FeedPresenter{
    weak var view: FeedViewInput?
    weak var moduleOutput: LoginModuleOutput?
    private let router: FeedRouterInput
    private let interactor: FeedInteractorInput
    
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
extension FeedPresenter: FeedViewInput{
    func displayNews() {
         
    }
    
    func displayStocks() {
         
    }
    
    
}

extension FeedPresenter: FeedViewOutput{
    
}

extension FeedPresenter: FeedInteractorOutput{
    func updateStocks() {
         
    }
    
    func updateNews() {
         
    }
    
    
}
