//
//  ConfirmContainer.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import Foundation
import UIKit

final class ConfirmContainer{
    let input: ConfirmModuleInput
    let viewController: UIViewController
    
    class func assemble(context: ConfirmContext)-> ConfirmContainer{
        let router = ConfirmRouter()
        let interactor = ConfirmInteractor(context.phoneNumber)
        let presenter = ConfirmPresenter(router, interactor)
        let viewController = ConfirmViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.output
        
        interactor.presenter = presenter
        
        return ConfirmContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: ConfirmModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct ConfirmContext {
    weak var output: ConfirmModuleOutput?
    let phoneNumber: String
    init(moduleOutput: ConfirmModuleOutput, number: String){
        output = moduleOutput
        phoneNumber = number
    }
}
