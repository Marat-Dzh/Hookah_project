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


extension BookingPresenter: BookingViewOutput{
    func viewDidLoad(){
        self.view?.set(viewModels: self.makeViewModels())
    }
}

extension BookingPresenter: BookingInteractorOutput{
    
}

private extension BookingPresenter {
    func makeViewModels() -> [BookingCardViewModel] {
        return [BookingCardViewModel(info: "Конструкутор кальяна", title: "title 1", shortDescription: "Собери свой кальян", imageName: "Constructor"),
                BookingCardViewModel(info: "Лимоно-имбирный чай", title: "title 2", shortDescription: "800мл   450 руб.", imageName: "lemontea"),
                BookingCardViewModel(info: "Ягодный чай", title: "title 3", shortDescription: "800мл   450 руб.", imageName: "berrytea"),
                BookingCardViewModel(info: "Облепиховый чай", title: "title 3", shortDescription: "800мл   450 руб.", imageName: "seabuckthorntea")]
    }
}
