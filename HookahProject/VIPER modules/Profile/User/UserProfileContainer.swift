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
    
    class func assemble(userInfo: UserInfo?) -> UserProfileContainer{
        let router = UserProfileRouter()
        let interactor = UserProfileInteractor(info: userInfo)
        let presenter = UserProfilePresenter(router, interactor)
        let viewController = UserProfileViewController(output: presenter)
        
        presenter.view = viewController

        return UserProfileContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: UserProfileModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
