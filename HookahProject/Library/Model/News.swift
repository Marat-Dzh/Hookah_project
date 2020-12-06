//
//  NewsModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import UIKit

final class News{
    let newsTitle: String
    let newsImage: UIImage
    let newsDescription: String
    init(newsTitle: String, newsImage: UIImage, newsDescription: String) {
        self.newsTitle = newsTitle
        self.newsImage = newsImage
        self.newsDescription = newsDescription
    }
}
