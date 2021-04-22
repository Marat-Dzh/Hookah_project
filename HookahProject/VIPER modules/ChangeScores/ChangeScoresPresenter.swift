//
//  ChangeScoresPresenter.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import UIKit

class ChangeScoresPresenter {
    weak var view: ChangeScoresViewInput?
    
    private let router: ChangeScoresRouterInput
    private let interactor: ChangeScoresInteractorInput
    
    init(router: ChangeScoresRouterInput, interactor: ChangeScoresInteractorInput){
        self.router = router
        self.interactor = interactor
    }
}

extension ChangeScoresPresenter: ChangeScoresViewOutput {
    func changeScores(card: String, scores: String) {
        guard let cardInt = Int(card) else { return }
        guard let scoresInt = Int(scores) else {return}
        self.router.acChangeScores(card: cardInt, scores: scoresInt) { [weak self] (cardInt1, scoresInt1) in
            guard let self = self else { return }
            self.interactor.changeScoresInFB(cardInt: cardInt1, scoresInt: scoresInt1)
        }

    }
    
    func plusScorese(card: String, scores: String) {
        guard let cardInt = Int(card) else { return }
        guard let scoresInt = Int(scores) else {return}
        self.interactor.plusScoresInFB(cardInt: cardInt, scoresInt: scoresInt)
    }
}

extension ChangeScoresPresenter: ChangeScoresInteractorOutput {
    
}

extension ChangeScoresPresenter: ChangeScoresModuleInput {
    
}

extension ChangeScoresPresenter: ChangeScoresRouterOutput {
    
}
