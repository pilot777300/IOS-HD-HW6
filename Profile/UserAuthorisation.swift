//
//  UserAuthorisation.swift
//  NavigTest
//
//  Created by Mac on 07.10.2022.
//

import Foundation
import UIKit

    public let loginDataBase: [String: String] = ["user1": "pass1", "user2": "pass2"]
    public let fakeLoginDataBase: [String: String] = ["fakeuser": "fakepass"]

    class User {
    var login: String?
    var fullName: String?
    var avatar = UIImage()
    var status: String?
}

    protocol UserService {
    func authorise(login: String?, password: String?) -> User?
}

    class CurrentUserService: UserService {
    
    var object = User()
   
    init () {
        object = User()
    }
    
    func authorise(login: String?, password: String?) -> User? {
    
            if  (loginDataBase.keys.contains(login ?? "Введите логин") && loginDataBase.values.contains(password ?? "Введите пароль"))
        {
                return User()
            }
        return nil
    }
}



    class TestUserService: UserService {
    
    var testUser = User()
    
    init() {
        testUser = User()
    }
    
    func authorise(login: String?, password: String?) -> User? {
        if  (fakeLoginDataBase.keys.contains(login ?? "Введите логин") && fakeLoginDataBase.values.contains(password ?? "Введите пароль"))
    {
            return User()
        }
    return nil
        }
    }
