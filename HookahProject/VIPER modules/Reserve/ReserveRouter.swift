//
//  ReserveRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import UIKit

final class ReserveRouter{
    weak var output: ReserveRouterOutput?
    weak var viewController: UIViewController?
    let notifications = Notifications()
    init() {
        
    }
}

extension ReserveRouter: ReserveRouterInput {
    func suссessReserve1(dateString: String, numGuest: String, completion: @escaping (String, String) -> Void) {
        //let date = self.reserveView.datePickerToReserve.date
        let acSuccess = UIAlertController(title: "Бронирование успешно", message:  "\(dateString)\n Количество гостей: \(numGuest)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Oк", style: .default) { (action) in
            self.callNotification()
            
        }
        acSuccess.addAction(okAction)
        if let viewController = viewController {
            viewController.present(acSuccess, animated: true, completion: nil)
        }
        completion(dateString, numGuest)
    }
    
    func errorReserve() {
        let acSuccess = UIAlertController(title: "Броинрование невозможно", message: "Столик можно забронировать не меннее, чем за 45 минут", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Oк", style: .cancel, handler: nil)
        acSuccess.addAction(okAction)
        if let viewController = viewController {
            viewController.present(acSuccess, animated: true, completion: nil)
        }
    }
}

private extension ReserveRouter {
    func callNotification() {
        self.notifications.scheduleNotification(notificationType: "Админ уснул")
    }
}
