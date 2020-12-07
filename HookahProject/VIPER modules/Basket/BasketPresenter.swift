//
//  BasketPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 15.11.2020.
//

import Foundation
final class BasketPresenter{
    weak var view: BasketViewInput?
    weak var moduleOutput: LoginModuleOutput?
    private let router: BasketRouterInput
    private let interactor: BasketInteractorInput
    
    init(_ router: BasketRouterInput,_ interactor: BasketInteractorInput){
        self.interactor = interactor
        self.router = router
    }

}

extension BasketPresenter: BasketModuleInput{

}

extension BasketPresenter: BasketInteractorOutput{
    func makeModels() {
        self.view?.displayOrders(basketViewModels:makeViewModels())
    }
}

extension BasketPresenter: BasketViewOutput{
    func viewDidLoad(){
        interactor.getCatalog()
    }
}

private extension BasketPresenter {
    func makeViewModels() -> [BasketCardViewModel] {
        return [BasketCardViewModel(basketImageName: "tea", basketInfoProduct: "Чай", basketShortDescription: "Цена")]
    }
}
