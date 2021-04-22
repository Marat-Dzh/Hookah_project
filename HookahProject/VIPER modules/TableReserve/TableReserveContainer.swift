//
//  TableReserveContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import UIKit

final class TableReserveContainer{
    let viewController: UIViewController
    let moduleInput: TableReserveModuleInput?
    
    static func assemble() -> TableReserveContainer{
        let router = TableReserveRouter()
        let interactor = TableReserveInteractor()
        let presenter = TableReservePresenter(router: router, interactor: interactor)
        let viewController = TableReserveViewController(output: presenter)
        
        presenter.view = viewController
        
        interactor.output = presenter
        
        return TableReserveContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: TableReserveModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
