//
//  FeedModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 04.11.2020.
//

import Foundation

class FeedModel{
    var stocks: [Stock]
    var news: [News]
    
    init(stocks: [Stock], news: [News]){
        self.news = news
        self.stocks = stocks
    }
}
