//
//  LoginInteractor.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//

import Foundation
import Firebase
import FirebaseFirestore

final class LoginInteractor{
    weak var presenter: LoginInteractorOutput?
    //private let serviceFactory: LoginServiceFactory
    //private var loginService: BaseLoginService?
    
    /*init(_ service: LoginServiceFactory){
        self.serviceFactory = service
    }*/
    var db: Firestore!
    init() {
       
    }
}

extension LoginInteractor: LoginInteractorInput{
    func checkActiveSession() {
        Auth.auth().addStateDidChangeListener({ [weak self] (auth, user) in
            if user != nil
            {
                self?.presenter?.authorizationCompleted(context: (self?.formContext())!)
            }
        })
    }
    
    func login(type: AuthType, context: LoginData) {
        switch (type){
        case .loginAndPassword:
            let data = context as! LoginAndPasswordData
            Auth.auth().signIn(withEmail: data.login, password: data.password) { [weak self] (user, error) in
                if error != nil{
                    self?.presenter?.gotError(.error)
                    return
                }
                if user == nil{
                    self?.presenter?.gotError(.userNotFound)
                    return
                }
                self?.presenter?.authorizationCompleted(context: (self?.formContext())!)
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
                if error != nil{
                    self?.presenter?.gotError(.error)
                    return
                }
                if user == nil{
                    self?.presenter?.gotError(.userNotFound)
                    return
                }
                self?.db = Firestore.firestore()
                let authContext = self?.formContext()
                let user = UserContext(info: UserInfo(id: 0, points: 0, name: "user", email: authContext!.email, uId: authContext!.id, phoneNumber: 70000000000), history: [], orders: [])
                
                self?.db.collection("users").document(authContext!.id).setData(user.infoDict) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(String(describing: authContext?.id))")
                    }
                }
                self?.db=nil
                self?.presenter?.authorizationCompleted(context: authContext!)
                }
        case .phoneNumberAndSMS:
            //let data = context as! PhoneData
            return
        }
    }
}

private extension LoginInteractor{
    func formContext() -> AuthContext {
        let user: User = Auth.auth().currentUser!
        let context: AuthContext = AuthContext(id: user.uid, email: user.email!, type: .user)
        return context
    }
    func processResult(){
        
    }
}
