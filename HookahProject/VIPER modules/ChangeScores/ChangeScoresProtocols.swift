//
//  ChangeScoresProtocols.swift
//  HookahProject
//
//  Created by Олег Филатов on 04.12.2020.
//

import Foundation

protocol ChangeScoresModuleInput: class {
    
}

protocol ChangeScoresModuleOutput: class {
    
}

protocol ChangeScoresViewInput: class {
    
}

protocol ChangeScoresViewOutput: class {
    func minusScores(card: String, scores: String)
    func plusScorese(card: String, scores: String)
}

protocol ChangeScoresInteractorInput {
    func minusScoresInFB(cardInt: Int, scoresInt: Int)
    func plusScoresInFB(cardInt: Int, scoresInt: Int)
}

protocol ChangeScoresInteractorOutput: class {
    
}

protocol ChangeScoresRouterInput: class {
    
}

protocol ChangeScoresRouterOutput: class {
    
}
