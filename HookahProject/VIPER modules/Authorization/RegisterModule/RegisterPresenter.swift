//
//  RegisterPresenter.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.12.2020.
//
import Foundation

final class RegisterPresenter{
    weak var view: RegisterViewInput?
    weak var moduleOutput: RegisterModuleOutput?
    private let router: RegisterRouterInput
    private let interactor: RegisterInteractorInput
    
    init(_ router:RegisterRouterInput,_ interactor:RegisterInteractorInput){
        self.interactor = interactor
        self.router = router
    }
}

extension RegisterPresenter: RegisterModuleInput{
    
}

extension RegisterPresenter: RegisterViewOutput{
    func onRegisterTapped(data: [InputSource]) {
        let results = TextValidator.validateFields(inputs: data)
        if results.isEmpty {
            interactor.checkUnique(dict: makeInputDict(inputs: data), data:             (view?.getDataFromView())!)
        }
        else{
            view?.showError(errorResults: results)
        }
    }
}

extension RegisterPresenter: RegisterInteractorOutput{
    func checkDidSucceeded(data: RegisterData) {
        
        moduleOutput?.registerUser(data: data)
    }
    
    func checkFailed(errorResults: [FailureResult]) {
        view?.showError(errorResults: errorResults)
    }
}

private extension RegisterPresenter{
    func makeInputDict(inputs: [InputSource]) -> [String : InputSource]{
        var dict = Dictionary<String, InputSource>()
        for item in inputs{
            dict[item.getContent()] = item
        }
        let result = dict
        return result
    }
}
