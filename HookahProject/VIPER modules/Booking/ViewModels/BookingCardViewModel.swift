//
//  BookingCardViewModel.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import UIKit

struct BookingCardViewModel {
    let info: String
    let title: String
    let shortDescription: String
    let imageName: String
    
    static func makeExample() -> BookingCardViewModel {
        BookingCardViewModel(info: "Название чая", title: "title 3", shortDescription: "Описанаие", imageName: "tea")
    }
}
