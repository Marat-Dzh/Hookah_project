//
//  BookingInteractor.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import Foundation

final class BookingInteractor{
    weak var presenter: BookingInteractorOutput?
    
}

extension BookingInteractor: BookingInteractorInput{
    func addToBasket() {
        //
    }
    
    func getCatalog() {
        //getting catalog from firebase database
        presenter?.makeModels(feedModel: FeedModel(stocks: [], news: []))
    }
}
