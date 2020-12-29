//
//  RegisterClasses.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.12.2020.
//

import Foundation

protocol InputSource: class {
    func displayError(message:String)
    func getContent() -> String
}

class RegisterData{
    let fio: String
    let email:String
    let phoneNumber: String
    let password: String
    var id:Int = 0
    init(fio: String, email: String, phoneNumber:String, pass: String) {
        self.fio=fio
        self.email=email
        self.phoneNumber=phoneNumber
        self.password = pass
    }
    var infoDict: [String:Any]{
        get{
            let temp: [String:Any] = [
                "fio": fio,
                "email": email,
                "phoneNumber":phoneNumber
            ]
            return temp
        }
    }
}

class FailureResult{
    weak var source: InputSource?
    let errorMessage: String
    init(source: InputSource?, errorMessage: String) {
        self.source = source
        self.errorMessage = errorMessage
    }
}

class TextValidator{
     class func validateFields(inputs: [InputSource]) -> [FailureResult] {
        var failureArr : [FailureResult] = []
        for item in inputs{
            if  item.getContent().isEmpty{
                print(item.getContent)
                let result = FailureResult(source: item, errorMessage: "Должно быть заполнено")
                failureArr.append(result)
            }
        }
        return failureArr
    }
}
