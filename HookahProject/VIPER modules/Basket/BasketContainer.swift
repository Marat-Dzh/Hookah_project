//
//  BasketContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import UIKit

final class BasketContainer{
    let input: BasketModuleInput
    let viewController: UIViewController
    
    class func assemble(context: BasketContext) -> BasketContainer{
        let router = BasketRouter()
        let interactor = BasketInteractor()
        let presenter = BasketPresenter(router, interactor)
        let viewController = BasketViewController(presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.output
        
        interactor.presenter = presenter
        
        return BasketContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: BasketModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct BasketContext {
    weak var output: LoginModuleOutput?
}
