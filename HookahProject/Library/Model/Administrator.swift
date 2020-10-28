//
//  AdministratorModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import Foundation

final class Administrator: BaseModel{
    let uniqueId: Int = 000000000000
    init(){
        super.init("admin")
    }
}
