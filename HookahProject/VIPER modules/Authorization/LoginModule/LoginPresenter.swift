//
//  LoginPresenter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation

final class LoginPresenter{
    weak var view: LoginViewInput?
    weak var moduleOutput: LoginModuleOutput?
    private let router: LoginRouterInput
    private let interactor: LoginInteractorInput
    
    init(_ router:LoginRouterInput,_ interactor:LoginInteractorInput){
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: LoginModuleInput{
    
}

extension LoginPresenter: LoginViewOutput{
    func register() {
        router.assembleRegisterModule()
    }
    
    func login(data: LoginData) {
        if data is LoginAndPasswordData{
            interactor.login(type: .loginAndPassword, context: data)
        }else if data is PhoneData{
            interactor.getVerificationID(phoneNumber: (data as! PhoneData).phoneNumber)
            router.assembleConfirmModule((data as! PhoneData).phoneNumber, self)
        }
    }
    
    func onClose() {
        /* View method */
    }
    
    func onSkip() {
        
    }
    func checkSession() {
        interactor.checkActiveSession()
    }
}

extension LoginPresenter: LoginInteractorOutput{
    func didSuccessCaptcha(phoneNumber: String) {
    }
    
    func gotError(_ error: ErrorType) {
        view?.showError(message: error.rawValue)
    }
    func didSuccessLogin(context: AuthContext) {
        moduleOutput?.loginByPhone(context: context)
    }
}

extension LoginPresenter: ConfirmModuleOutput{
    func loginBySMS(context: PhoneData) {
        interactor.login(type: .phoneNumberAndSMS, context: context)
    }
}

extension LoginPresenter: LoginRouterOutput{
    func registerUser(data: RegisterData){
        interactor.register(data: data)
    }
}
