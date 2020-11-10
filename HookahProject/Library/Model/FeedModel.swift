//
//  FeedModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 04.11.2020.
//

import Foundation

class FeedModel{
    let stocks: [Stock]
    let news: [News]
    
    init(stocks: [Stock], news: [News]){
        self.news = news
        self.stocks = stocks
    }
}
