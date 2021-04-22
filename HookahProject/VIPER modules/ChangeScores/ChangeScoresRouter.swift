//
//  ChangeScoresRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import UIKit

class ChangeScoresRouter {
    weak var output: ChangeScoresRouterOutput?
    weak var viewController: UIViewController?
    init() {
        
    }
}

extension ChangeScoresRouter: ChangeScoresRouterInput {
    func acChangeScores(card: Int, scores: Int, completion: @escaping (Int, Int) -> Void) {
        let acCS = UIAlertController(title: "Успешно", message: "Номер карты: \(card) \n Количество баллов: \(scores)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Oк", style: .default, handler: nil)
        acCS.addAction(okAction)
        self.viewController?.present(acCS, animated: true, completion: nil)
        completion(card, scores)
    }
}
