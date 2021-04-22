//
//  BaseRouter.swift
//  HookahProject
//
//  Created by Олег Филатов on 15.03.2021.
//

import UIKit

class BaseRouter {
    var navigationControllerProvider: (() -> UINavigationController?)?

    var navigationController: UINavigationController? {
        self.navigationControllerProvider?()
    }

}
