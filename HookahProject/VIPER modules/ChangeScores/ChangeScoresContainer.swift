//
//  ChangeScoresContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import UIKit

class ChangeScoresContainer {
    let viewController: UIViewController
    weak var moduleInput: ChangeScoresModuleInput?
    
    static func assemble() -> ChangeScoresContainer {
        let router = ChangeScoresRouter()
        let interactor = ChangeScoresInteractor()
        let presenter = ChangeScoresPresenter(router: router, interactor: interactor)
        let viewController = ChangeScoresViewController(output: presenter)
        
        presenter.view = viewController
        
        interactor.output = presenter
        
        return ChangeScoresContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: ChangeScoresModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
    
}
