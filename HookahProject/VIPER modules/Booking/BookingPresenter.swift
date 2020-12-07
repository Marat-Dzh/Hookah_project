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
        return [BookingCardViewModel(info: "info1", title: "Кальян на чаше", shortDescription: "800 руб.", imageName: "Constructor"),
                BookingCardViewModel(info: "info1", title: "Кальян на грейпфруте", shortDescription: "1200 руб.", imageName: "Constructor"),
                BookingCardViewModel(info: "Лимон, имбирь, мед", title: "Лимоно-имбирный чай", shortDescription: "800мл   450 руб.", imageName: "lemontea"),
                BookingCardViewModel(info: "малина, чёрная смородина, клюква", title: "Ягодный чай", shortDescription: "800мл   450 руб.", imageName: "berrytea"),
                BookingCardViewModel(info: "Облепиха, лимон", title: "Oблепиховый чай", shortDescription: "800мл   450 руб.", imageName: "seabuckthorntea"),
                BookingCardViewModel(info: "Невероятный тандем вкуса проявляется из черного цейлонского чая с кусочками ананаса и клубники, ягодами красной смородины, листьями смородины и лепестками сафлора", title: "Мишки Гамми", shortDescription: "1000мл   300 руб.", imageName: "seabuckthorntea"),
                BookingCardViewModel(info: "Известный всем зеленый чай с измельченными кусочками жасмина", title: "Зеленый с жасмином", shortDescription: "1000мл   300 руб.", imageName: "seabuckthorntea"),
                BookingCardViewModel(info: "Полезный и очень освежающий напиток с кусочками мяты и малины", title: "Малина с мятой", shortDescription: "1000мл   300 руб.", imageName: "berrytea")]
    }
}
