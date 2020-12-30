//
//  RegisterContainer.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.12.2020.
//

import Foundation
import UIKit

final class RegisterContainer{
    let input: RegisterModuleInput
    let viewController: UIViewController
    
    class func assemble(context: RegisterContext)-> RegisterContainer{
        let router = RegisterRouter()
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter(router, interactor)
        let viewController = RegisterViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.output
        
        interactor.presenter = presenter
        return RegisterContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: RegisterModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct RegisterContext {
    weak var output: RegisterModuleOutput?
}
