//
//  ReserveContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit

final class ReserveContainer {
    let viewController: UIViewController
    let moduleInput: ReserveModuleInput?
    private(set) weak var router: ReserveRouterInput?
    
    static func assemble() -> ReserveContainer {
        let router = ReserveRouter()
        let interactor = ReserveInteractor()
        let presenter = ReservePresenter(router: router, interactor: interactor)
        let viewController = ReserveViewController(output: presenter)
        
        presenter.view = viewController
        
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return ReserveContainer(viewController: viewController, moduleInput: presenter, router: router)
    }
    
    init(viewController: UIViewController, moduleInput: ReserveModuleInput?, router: ReserveRouterInput) {
        self.viewController = viewController
        self.moduleInput = moduleInput
        self.router = router
    }
}

struct ReserveContext {
    weak var moduleOutput: ReserveModuleOutput? 
}
