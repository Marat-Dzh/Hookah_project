//
//  BookingDetailPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 21.03.2021.
//

import Foundation

final class BookingDetailPresenter {
    weak var view: BookingDetailViewInput?
    weak var moduleOutput: BookingDetailModuleOutput?
    
    private let router: BookingDetailRouterInput
    private let interactor: BookingDetailInteractorInput
    
    init(router: BookingDetailRouterInput, interactor: BookingDetailInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    
}

extension BookingDetailPresenter: BookingDetailViewOutput {

}


extension BookingDetailPresenter: BookingDetailInteractorOutput {

}

extension BookingDetailPresenter: BookingDetailModuleInput {
    func setBookingDetailInfo(bcvm: BookingCardViewModel) {
        self.view?.setupBookingDetail(bcvm: bcvm)
    }
}

extension BookingDetailPresenter: BookingDetailRouterOutput {
    
}
