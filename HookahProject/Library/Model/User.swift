//
//  UserModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

import FirebaseFirestore

final class UserContext{
    var info: UserInfo
    var ordersHistory: [Order]
    var activeOrders: [Order]
    init(info: UserInfo, history: [Order], orders:[Order]){
        self.info = info
        self.ordersHistory = history
        self.activeOrders = orders
    }
    
    var infoDict: [String:Any]{
        get{
            let temp: [String:Any] = [
                "fio": info.fio,
                "email": info.email,
                "cardId":info.cardId,
                "numberOfPoints":info.numberOfPoints,
                "phoneNumber": info.phoneNumber,
                "orders":[],
                "historyOrders":[]
            ]
            return temp
        }
    }
}

final class UserInfo: PersonInfo{
    let cardId: Int
    let numberOfPoints: Int
    let phoneNumber: Int
    
    init(){
        self.cardId=0
        self.numberOfPoints=0
        self.phoneNumber = 0
        super.init("","","")
    }
    
    init(id:Int, points:Int, name:String, email:String, uId:String, phoneNumber: Int){
        self.cardId=id
        self.numberOfPoints=points
        self.phoneNumber = phoneNumber
        super.init(name,email,uId)
    }
    init(doc: DocumentSnapshot){
        let data = doc.data()!
        cardId = data["cardId"] as! Int
        numberOfPoints = data["numberOfPoints"] as! Int
        phoneNumber = data["phoneNumber"] as! Int
        super.init(data["fio"] as? String ?? "jjj", data["email"] as? String ?? "",data["uId"] as? String ?? "")
        
    }
}
