//
//  UserModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

final class UserContext{
    let info: UserInfo
    
    init(info: UserInfo){
        self.info = info
    }
}

final class UserInfo: PersonInfo{
    let cardId: Int
    let numberOfPoints: Int
    init(id:Int, points:Int, name:String){
        self.cardId=id
        self.numberOfPoints=points
        super.init(name)
    }
}
