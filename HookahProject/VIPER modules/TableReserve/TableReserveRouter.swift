//
//  TableTableReserveRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 02.12.2020.
//

import UIKit

final class TableReserveRouter{
    weak var output: TableReserveRouterOutput?
    
    init() {
        
    }
}

extension TableReserveRouter: TableReserveRouterInput {
    func callVisitor(phoneNumber: String) {
        guard let number = URL(string: "tel://" + phoneNumber)  else { return }
        UIApplication.shared.open(number)
    }
}
