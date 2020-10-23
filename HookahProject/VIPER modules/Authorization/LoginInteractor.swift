//
//  LoginInteractor.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation

final class LoginInteractor{
    weak var presenter: LoginInteractorOutput?
    private let serviceFactory: LoginServiceFactory
    private var loginService: BaseLoginService?
    
    init(_ service: LoginServiceFactory){
        self.serviceFactory = service
    }
    
}

extension LoginInteractor: LoginInteractorInput{
    func login(type: AuthType, context: LoginData) {
        loginService = serviceFactory.makeLoginService(type: type, data: context)
        let result = loginService?.loginServer()
        switch result?.errorType {
        case .noError:
            self.presenter?.authorizationCompleted()
        case .notFound:
            self.presenter?.gotError()
        default:
            self.presenter?.gotError()
        }
            
    }
}
