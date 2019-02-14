//
//  MemberModel.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 10/01/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//


import UIKit


class MemberModel: NSObject, NSCoding  {
    // MARK: - NSCoding
    required init(coder aDecoder: NSCoder) {
        descricao = aDecoder.decodeObject(forKey: "descricao") as? String
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Double
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(descricao, forKey: "descricao")
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
    }
    
    
    var descricao: String?
    var latitude: Double?
    var longitude: Double?

    init(_ descricao: String, _ latitude: Double, _ longitude: Double) {
        self.descricao = descricao
        self.latitude = latitude
        self.longitude = longitude
    }
}

class Member {

    var database = Database.instance()
    
    var model = MemberModel("",0,0)
    
    func insertMember(_ membro: MemberModel) {
        database.insert(add: membro)
    }

    func updateMember(_ membro: MemberModel,_ index: Int){
        database.update(add: membro, index)
    }

    func deleteMember(_ index: Int){
        database.delete(add: index)
    }

    func getMembers() -> Array<MemberModel>{
        return database.list()
    }
    
    

}

