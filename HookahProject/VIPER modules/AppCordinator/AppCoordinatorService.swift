//
//  AppCoordinatorProtocols.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 10.11.2020.
//

import Foundation

class AppCoordinatorService{
    class func getPersonContext(context: AuthContext) -> UserContext{
        //perform firebase query to create UserContext
        //...
        //...
        return UserContext(info: UserInfo(id: 0, points: 0, name: "", email: "", uId: ""), history: [], orders: [])
    }
}
