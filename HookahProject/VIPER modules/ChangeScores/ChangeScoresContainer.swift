//
//  ChangeScoresContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import UIKit

class ChangeScoresContainer {
    let viewController: UIViewController
    let moduleInput: ChangeScoresModuleInput?
    private(set) weak var router: ChangeScoresRouterInput?
    
    static func assemble() -> ChangeScoresContainer {
        let router = ChangeScoresRouter()
        let interactor = ChangeScoresInteractor()
        let presenter = ChangeScoresPresenter(router: router, interactor: interactor)
        let viewController = ChangeScoresViewController(output: presenter)
        
        presenter.view = viewController
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return ChangeScoresContainer(viewController: viewController, moduleInput: presenter, router: router)
    }
    
    init(viewController: UIViewController, moduleInput: ChangeScoresModuleInput?, router: ChangeScoresRouterInput) {
        self.viewController = viewController
        self.moduleInput = moduleInput
        self.router = router
    }
    
}

struct ChangeScoresContext {
    weak var moduleOutput: ChangeScoresModuleOutput?
}
