//
//  UserModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

final class UserContext{
    let info: UserInfo
    let ordersHistory: [Order]
    let activeOrders: [Order]
    init(info: UserInfo, history: [Order], orders:[Order]){
        self.info = info
        self.ordersHistory = history
        self.activeOrders = orders
    }
}

final class UserInfo: PersonInfo{
    let cardId: Int
    let numberOfPoints: Int
    init(id:Int, points:Int, name:String, email:String){
        self.cardId=id
        self.numberOfPoints=points
        super.init(name,email)
    }
}
