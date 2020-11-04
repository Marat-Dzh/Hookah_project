//
//  AdministratorModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

final class AdministratorContext{
    
}

final class AdministratorInfo: PersonInfo{
    let uId: Int
    init(id: Int){
        self.uId = id
        super.init("admin")
    }
}
