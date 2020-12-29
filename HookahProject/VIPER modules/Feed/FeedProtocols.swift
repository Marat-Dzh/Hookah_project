//
//  FeedProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

protocol FeedViewInput: class{
    func displayNews()
    func displayStocks()
}

protocol FeedViewOutput : class{
    
}

protocol FeedModuleInput: class{
    func getNews()
    func getStocks()
}

protocol FeedModuleOutput: class{
    
}

protocol FeedInteractorInput{
    func getNewsFromServer()
    func getStocksFromServer()
}

protocol FeedInteractorOutput: class{
    func updateStocks()
    func updateNews()
}

protocol FeedRouterInput{
    
}
