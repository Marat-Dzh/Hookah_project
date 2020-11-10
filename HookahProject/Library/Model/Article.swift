//
//  Article.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 04.11.2020.
//

import Foundation

class Article{
    let title: String
    let description: String?
    // let image: ImageType
    init(title: String, description: String?){
        self.title = title
        self.description = description
    }
}
