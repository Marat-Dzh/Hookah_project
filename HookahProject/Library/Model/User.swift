//
//  UserModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 19.10.2020.
//

final class User: BaseModel{
    let cardId: Int
    let numberOfPoints: Int
    init(id:Int, points:Int, name:String){
        self.cardId=id
        self.numberOfPoints=points
        super.init(name)
    }
}
