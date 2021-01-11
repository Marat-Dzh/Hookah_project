//
//  FeedContainer.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import Foundation
import UIKit

final class FeedContainer{
    weak var input: FeedModuleInput?
    let viewController: UIViewController
    
    class func assemble(context: FeedContext)-> FeedContainer{
        let router = FeedRouter(context: context)
        let interactor = FeedInteractor()
        let presenter = FeedPresenter(router, interactor)
        let viewController = FeedViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.output
        
        interactor.output = presenter
        
        return FeedContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: FeedModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct FeedContext {
    weak var output: LoginModuleOutput?
}
