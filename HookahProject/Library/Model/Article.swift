//
//  Article.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 04.11.2020.
//

import Foundation
import UIKit

class Article{
    let title: String
    let description: String?
    let image: UIImage
    init(title: String, description: String?, image:UIImage){
        self.title = title
        self.description = description
        self.image = image
    }
}
