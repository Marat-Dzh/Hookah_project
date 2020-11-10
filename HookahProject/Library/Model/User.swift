//
//  UserModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

final class UserContext{
    var info: UserInfo
    var ordersHistory: [Order]
    var activeOrders: [Order]
    init(info: UserInfo, history: [Order], orders:[Order]){
        self.info = info
        self.ordersHistory = history
        self.activeOrders = orders
    }
}

final class UserInfo: PersonInfo{
    let cardId: Int
    let numberOfPoints: Int
    init(id:Int, points:Int, name:String, email:String, uId:String){
        self.cardId=id
        self.numberOfPoints=points
        super.init(name,email,uId)
    }
}
