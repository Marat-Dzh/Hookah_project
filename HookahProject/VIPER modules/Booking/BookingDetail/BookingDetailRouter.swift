//
//  BookingDetailRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 21.03.2021.
//

import UIKit


final class BookingDetailRouter{
    weak var output: BookingDetailRouterOutput?
    weak var viewController: UIViewController?
    init() {
        
    }
}

extension BookingDetailRouter: BookingDetailRouterInput {
    
}
