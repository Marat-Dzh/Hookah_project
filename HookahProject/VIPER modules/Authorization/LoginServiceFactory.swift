//
//  LoginServiceFactory.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation

class BaseLoginService{
    init(){
        
    }
    func loginServer() -> AuthenticationResult {
        //asking server for a permission
        let result = AuthenticationResult()
        return result
    }
}

final class PhoneLoginService: BaseLoginService{

    override init(){
        
    }
}

class StandartLoginService: BaseLoginService {
    
    override init(){
        
    }
}

class LoginServiceFactory{
    func makeLoginService(type: AuthType, data:LoginData)->BaseLoginService{
        switch type {
        case .loginAndPassword:
            let service = StandartServiceFactory()
            return service.factoryMethod(data: data)
        case .phoneNumberAndSMS:
            let service = PhoneServiceFactory()
            return service.factoryMethod(data: data)
        }
    }
}

class PhoneServiceFactory: LoginServiceFactory {
    func factoryMethod(data: LoginData) -> BaseLoginService {
        //let phoneData = data as? PhoneData
        //make service
        let service = PhoneLoginService()
        return service
    }
}

class StandartServiceFactory: LoginServiceFactory {
    func factoryMethod(data: LoginData) -> BaseLoginService {
        //let standartLoginData = data as? LoginAndPasswordData
        //make service
        let service = StandartLoginService()
        return service
    }
}
