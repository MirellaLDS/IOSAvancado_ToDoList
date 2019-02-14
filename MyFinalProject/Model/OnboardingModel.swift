//
//  OnboardingModel.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 10/02/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import Foundation

class OnboardingModel {
    
    var database = DatabaseOnboarding.instance()
    
    func insert(_ txt: String) {
        database.insert(add: txt)
        //        self.encodding(membro)
        //        self.decode()
    }
    //
    func update(_ txt: String,_ index: Int){
        database.update(add: txt, index)
    }
    
    func delete(_ index: Int){
        database.delete(add: index)
    }
    
    func list() -> Array<String>{
        return database.list()
    }
    
    
    
}
