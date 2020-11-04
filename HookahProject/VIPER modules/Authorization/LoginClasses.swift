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

enum ErrorType: String{
    case userNotFound
    case error
    case noError
}

protocol LoginData{
    
}

struct PhoneData : LoginData{
    let phoneNumber: String
    init(_ phoneNumber:String){
        self.phoneNumber = phoneNumber
    }
}

struct LoginAndPasswordData: LoginData {
    let login: String
    let password: String
    init(_ login: String, _ password: String){
        self.login = login
        self.password = password
    }
}

struct AuthContext{
    
}
