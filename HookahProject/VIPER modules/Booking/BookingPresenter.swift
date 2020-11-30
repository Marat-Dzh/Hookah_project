//
//  BookingPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import Foundation
final class BookingPresenter{
    weak var view: BookingViewInput?
    weak var moduleOutput: LoginModuleOutput?
    private let router: BookingRouterInput
    private let interactor: BookingInteractorInput
    
    init(_ router:BookingRouterInput,_ interactor:BookingInteractorInput){
        self.interactor = interactor
        self.router = router
    }

}

extension BookingPresenter: BookingModuleInput{

}

extension BookingPresenter: BookingInteractorOutput{
    func makeModels() {
        self.view?.set(viewModels:makeViewModels())
    }
}

extension BookingPresenter: BookingViewOutput{
    func viewDidLoad(){
        interactor.getCatalog()
    }
}

private extension BookingPresenter {
    func makeViewModels() -> [BookingCardViewModel] {
        return [BookingCardViewModel(info: "info1", title: "Конструкутор кальяна", shortDescription: "Собери свой кальян", imageName: "Constructor"),
                BookingCardViewModel(info: "info2", title: "Лимоно-имбирный чай", shortDescription: "800мл   450 руб.", imageName: "lemontea"),
                BookingCardViewModel(info: "info3", title: "Ягодный чай", shortDescription: "800мл   450 руб.", imageName: "berrytea"),
                BookingCardViewModel(info: "info4", title: "Oблепиховый чай", shortDescription: "800мл   450 руб.", imageName: "seabuckthorntea")]
    }
}
