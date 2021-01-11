//
//  FeedProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation
import UIKit

protocol FeedViewInput: class{
    func setStories(storiesList: [UIImage])
    func setNews(newsList: [News])
}

protocol FeedViewOutput : class{
    func fetchImageStories()
    func fetchNews()
}

protocol FeedModuleInput: class{
    func getNews()
    func getStocks()
}

protocol FeedModuleOutput: class{
    
}

protocol FeedInteractorInput{
    func fetchNewsFromFB()
    func fetchStoriesFromFB()
}

protocol FeedInteractorOutput: class{
    func updateStories(images: [URL])
    func updateNews()
}

protocol FeedRouterInput{
    
}
