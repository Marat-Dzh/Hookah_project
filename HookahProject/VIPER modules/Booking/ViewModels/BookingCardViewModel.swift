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
    
    static func makeExample() -> [BookingCardViewModel] {
        return [BookingCardViewModel(info: "Конструкутор кальяна", title: "title 1", shortDescription: "Собери свой кальян", imageName: "Constructor"),
                BookingCardViewModel(info: "Лимоно-имбирный чай", title: "title 2", shortDescription: "800мл   450 руб.", imageName: "lemontea"),
                BookingCardViewModel(info: "Ягодный чай", title: "title 3", shortDescription: "800мл   450 руб.", imageName: "berrytea"),
                BookingCardViewModel(info: "Облепиховый чай", title: "title 3", shortDescription: "800мл   450 руб.", imageName: "seabuckthorntea")]
    }
}
