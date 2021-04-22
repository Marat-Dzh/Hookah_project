//
//  BookingDetailContainer.swift
//  HookahProject
//
//  Created by Олег Филатов on 21.03.2021.
//

import UIKit

final class BookingDetailContainer {
    let viewController: UIViewController
    weak var moduleInput: BookingDetailModuleInput?
    private(set) weak var router: BookingDetailRouterInput?
    
    class func assemble(context: BookingDetailContext) -> BookingDetailContainer {
        let router = BookingDetailRouter()
        let interactor = BookingDetailInteractor()
        let presenter = BookingDetailPresenter(router: router, interactor: interactor)
        let viewController = BookingDetailViewController(output: presenter)
        
        presenter.view = viewController
        
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return BookingDetailContainer(viewController: viewController, moduleInput: presenter, router: router)
    }
    
    init(viewController: UIViewController, moduleInput: BookingDetailModuleInput?, router: BookingDetailRouterInput) {
        self.viewController = viewController
        self.moduleInput = moduleInput
        self.router = router
    }
}

struct BookingDetailContext {
    weak var moduleOutput: BookingDetailModuleOutput?
    let bookingCardViewModel: BookingCardViewModel
    init(bookingCardViewModel: BookingCardViewModel, moduleOutput: BookingDetailModuleOutput?) {
        self.bookingCardViewModel = bookingCardViewModel
        self.moduleOutput = moduleOutput
    }
}
