//
//  AdministratorModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

final class AdministratorContext{
    var info: AdministratorInfo
    
    init(info: AdministratorInfo){
        self.info = info
    }
}

final class AdministratorInfo: PersonInfo{
    let uId: Int
    init(id: Int, email: String, uId: String){
        self.uId = id
        super.init("admin",email,uId)
    }
}
