//
//  AutenticationModel.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 10/01/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import UIKit

class AutenticationModel {

    
    func validarLogin(_ user: String,_ password: String) -> UserTypeEnumeration {
        
        if user == "admin" && password == "admin"{
            return UserTypeEnumeration.Admin
        }else if user == "view" && password == "view"{
            return UserTypeEnumeration.View
        }
        return UserTypeEnumeration.Invalid
    }
    
    func isUserValid(_ userTypeEnum: UserTypeEnumeration) -> Bool {
        switch userTypeEnum{
        case .Admin:
            return true
        case .View:
            return true
        case .Invalid:
            return false
        }
    }
    
    func isAdmin(_ userTypeEnum: UserTypeEnumeration) -> Bool{
        if userTypeEnum == UserTypeEnumeration.Admin{
            return true
        }
        return false
    }

}
