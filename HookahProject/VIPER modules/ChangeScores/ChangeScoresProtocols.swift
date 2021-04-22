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
    func changeScores(card: String, scores: String)
    func plusScorese(card: String, scores: String)
}

protocol ChangeScoresInteractorInput {
    func changeScoresInFB(cardInt: Int, scoresInt: Int)
    func plusScoresInFB(cardInt: Int, scoresInt: Int)
}

protocol ChangeScoresInteractorOutput: class {
    
}

protocol ChangeScoresRouterInput: class {
    func acChangeScores(card: Int, scores: Int, completion: @escaping (Int, Int) -> Void)
}

protocol ChangeScoresRouterOutput: class {
    
}
