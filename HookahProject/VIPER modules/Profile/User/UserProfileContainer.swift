//
//  UserProfileContainer.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import UIKit

final class UserProfileContainer{
    let viewController: UIViewController
    weak var moduleInput: UserProfileModuleInput?
    
    static func assemble() -> UserProfileContainer{
        let router = UserProfileRouter()
        let interactor = UserProfileInteractor()
        let presenter = UserProfilePresenter(router: router, interactor: interactor)
        let viewController = UserProfileViewController(output: presenter)
        
        return UserProfileContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: UserProfileModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
