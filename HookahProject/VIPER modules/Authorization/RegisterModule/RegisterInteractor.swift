//
//  RegisterInteractor.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 28.12.2020.
//

import Foundation
import FirebaseFirestore

final class RegisterInteractor{
    weak var presenter: RegisterInteractorOutput?
    var db: Firestore!
    init() {
       
    }
}

extension RegisterInteractor: RegisterInteractorInput{
    func checkUnique(dict: [String: InputSource], data: RegisterData){
        let isOk = true
        
        if isOk{
            presenter?.checkDidSucceeded(data: data)
        }else{
      //      presenter?.checkFailed(errorResults: [])
        }
    }
}
