//
//  BookingContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.11.2020.
//

import UIKit

final class BookingContainer{
    let input: BookingModuleInput?
    let viewController: UIViewController
    
    class func assemble(context: BookingContext) -> BookingContainer{
        let router = BookingRouter()
        let interactor = BookingInteractor()
        let presenter = BookingPresenter(router, interactor)
        let viewController = BookingViewController(presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        router.navigationControllerProvider = { [weak viewController] in
            viewController?.navigationController
        }
        
        interactor.output = presenter
        
        return BookingContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: BookingModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct BookingContext {
    weak var moduleOutput: BookingModuleOutput?
}
