//
//  ConfirmInteractor.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 26.12.2020.
//

import Foundation
import Firebase

final class ConfirmInteractor{
    let phoneNumber: String
    weak var presenter: ConfirmInteractorOutput?
    
    init(_ number: String) {
        self.phoneNumber = number
    }
}

extension ConfirmInteractor: ConfirmInteractorInput{
    func resendMessage() {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] (verificationID, error) in
            guard let self = self else { return }
          if error != nil {
            self.presenter?.gotError(error?.localizedDescription ?? "Unknown Error...")
            return
          } else{
            UserDefaults.standard.set(verificationID, forKey: "VerificationID")
          }
        }
    }
    
    func getInfo() -> String {
        return phoneNumber
    }
}
