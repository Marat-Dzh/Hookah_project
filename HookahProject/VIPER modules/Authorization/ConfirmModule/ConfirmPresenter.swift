//
//  ConfirmPresenter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import Foundation

final class ConfirmPresenter{
    weak var view: ConfirmViewInput?
    weak var moduleOutput: ConfirmModuleOutput?
    private let router: ConfirmRouterInput
    private let interactor: ConfirmInteractorInput
    
    init(_ router:ConfirmRouterInput,_ interactor:ConfirmInteractorInput){
        self.interactor = interactor
        self.router = router
    }
}

extension ConfirmPresenter: ConfirmModuleInput{
    
}

extension ConfirmPresenter: ConfirmViewOutput{
    func viewDidLoad() {
        
        view?.showInfo(info: interactor.getInfo())
    }
    
    func onConfirmTapped(context: PhoneData) {
        
        moduleOutput?.loginBySMS(context: context)
    }
    
    func onResendTapped() {
        interactor.resendMessage()
    }
}

extension ConfirmPresenter: ConfirmInteractorOutput{
    func gotError(_ error: String) {
        view?.showError(message: error)
    }
}
