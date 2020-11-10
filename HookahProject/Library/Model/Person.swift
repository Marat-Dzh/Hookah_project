//
//  BaseModel.swift
//  HookahProject
//
//  Created by Nikita Kuznetsov on 23.10.2020.
//
import Foundation

class PersonContext{
    
}

class PersonInfo{
    var fio: String
    var email: String
    var userId: String
    init(_ fio:String, _ email:String, _ uId: String){
        self.fio=fio
        self.email = email
        self.userId = uId
    }
}
