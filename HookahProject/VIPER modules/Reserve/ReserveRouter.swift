//
//  ReserveRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 28.11.2020.
//

import Foundation

final class ReserveRouter{
    weak var output: ReserveRouterOutput?
    
    init() {
        
    }
}

extension ReserveRouter: ReserveRouterInput {
}
