//
//  LoginInteractor.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation
import Firebase

final class LoginInteractor{
    weak var presenter: LoginInteractorOutput?
    //private let serviceFactory: LoginServiceFactory
    //private var loginService: BaseLoginService?
    
    /*init(_ service: LoginServiceFactory){
        self.serviceFactory = service
    }*/
    
}

extension LoginInteractor: LoginInteractorInput{
    func login(type: AuthType, context: LoginData) {
        switch (type){
        case .loginAndPassword:
            let data = context as! LoginAndPasswordData
            Auth.auth().signIn(withEmail: data.login, password: data.password) { [weak self] (user, error) in
                if error==nil{
                    self?.presenter?.gotError(.error)
                }
                if user==nil{
                    self?.presenter?.gotError(.userNotFound)
                }
                //make AuthContext
                //call presenter func
                }
        case .phoneNumberAndSMS:
            //let data = context as! PhoneData
            return
        }
    }
    func register(type: AuthType, data: LoginData) {
        switch (type){
        case .loginAndPassword:
            let data = data as! LoginAndPasswordData
            Auth.auth().createUser(withEmail: data.login, password: data.password) { [weak self] (user, error) in
                if error==nil{
                    self?.presenter?.gotError(.error)
                }
                if user==nil{
                    self?.presenter?.gotError(.userNotFound)
                }
                //user.
                }
        case .phoneNumberAndSMS:
            //let data = context as! PhoneData
            return
        }
    }
}
