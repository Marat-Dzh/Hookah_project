//
//  LoginClasses.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation

enum AuthType{
    case loginAndPassword
    case phoneNumberAndSMS
}

enum ErrorType{
    case notFound
    case noError
}

final class AuthenticationResult {
    let success: Bool
    let data: BaseModel?
    let errorType: ErrorType
    init(){
        success = true
        data = nil
        errorType = .noError
    }
    init(_ success:Bool, _ data: BaseModel?,_ errorType: ErrorType){
        self.success = success
        self.data = data
        self.errorType = errorType
    }
}

class LoginData{
    
}

final class PhoneData : LoginData{
    let phoneNumber: String
    init(_ phoneNumber:String){
        self.phoneNumber = phoneNumber
    }
}

class LoginAndPasswordData: LoginData {
    let login: String
    let password: String
    init(_ login: String, _ password: String){
        self.login = login
        self.password = password
    }
}

