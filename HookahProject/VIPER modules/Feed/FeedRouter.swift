//
//  FeedRouter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import Foundation

final class FeedRouter{
    let feedContext: FeedContext
    
    init(context: FeedContext){
        self.feedContext = context
    }
}

extension FeedRouter: FeedRouterInput{
    
}
