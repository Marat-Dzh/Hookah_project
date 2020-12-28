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
    
    class func assemble(userInfo: UserProfileContext) -> UserProfileContainer{
        let router = UserProfileRouter()
        let interactor = UserProfileInteractor(info: userInfo.info)
        let presenter = UserProfilePresenter(router, interactor)
        let viewController = UserProfileViewController(output: presenter)
        
        interactor.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = userInfo.moduleOutput
        
        return UserProfileContainer(viewController: viewController, moduleInput: presenter)
    }
    
    init(viewController: UIViewController, moduleInput: UserProfileModuleInput?) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}

struct UserProfileContext {
    let info: UserInfo?
    let moduleOutput: UserProfileModuleOutput?
    init(userInfo: UserInfo?, output: UserProfileModuleOutput?){
        info = userInfo
        moduleOutput = output
    }
}
