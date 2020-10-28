//
//  StocksModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

final class Stock{
    let title: String
    let description: String?
    // let image: ImageType
    init(title: String, description: String?){
        self.title = title
        self.description = description
    }
}
