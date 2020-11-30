//
//  ReserveContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit

final class ReserveContainer{
    let viewController: UIViewController
    weak var moduleInput: ReserveModuleInput?
    
    static func assemble() -> ReserveContainer{
        let router = ReserveRouter()
        let interactor = ReserveInteractor()
        let presenter = ReservePresenter(router: router, interactor: interactor)
        let viewController = ReserveViewController(output: presenter)
        
        return ReserveContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: ReserveModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
