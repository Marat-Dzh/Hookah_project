//
//  LoginClasses.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation

enum AuthType : String{
    case loginAndPassword = "By Email"
    case phoneNumberAndSMS = "By Phone"
}

enum ErrorType: String{
    case userNotFound
    case error
    case noError
}

enum PersonType{
    case unknown
    case user
    case admin
}

protocol LoginData{
    
}

struct PhoneData : LoginData{
    let phoneNumber: String
    let verificationCode: String?
    let verificationId: String?
    init(_ phoneNumber:String, _ verID: String? = nil, _ verCode: String? = nil){
        self.phoneNumber = phoneNumber
        verificationId = verID
        verificationCode = verCode
    }
}

struct LoginAndPasswordData: LoginData {
    let login: String
    let password: String
    init(login: String, password: String){
        self.login = login
        self.password = password
    }
}

struct AuthContext{
    let personType: PersonType
    let id:String
    let email:String
    let phoneNumber: Int
    init(id:String, email:String, type: PersonType) {
        self.email=email
        self.id=id
        self.personType = type
        phoneNumber=Int()
    }
    init(id:String, number: Int, type: PersonType ){
        self.email=String()
        self.id=id
        self.personType = type
        phoneNumber=number
    }
}
