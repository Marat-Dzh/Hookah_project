//
//  FeedContainer.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.10.2020.
//

import Foundation
import UIKit

final class FeedContainer{
    let input: FeedModuleInput
    let viewController: UIViewController
    
    class func assemble(context: FeedContext)-> FeedContainer{
        let router = FeedRouter(context: context)
        let interactor = FeedInteractor()
        let presenter = FeedPresenter(router, interactor)
        let viewController = FeedViewController(presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.output
        
        interactor.presenter = presenter
        
        return FeedContainer(view: viewController, input: presenter)
    }
    
    private init(view: UIViewController, input: FeedModuleInput){
        self.input = input
        self.viewController = view
    }
}

struct FeedContext {
    weak var output: LoginModuleOutput?
    let feed: FeedModel
}
