//
//  Checker.swift
//  NavigTest
//
//  Created by Mac on 13.10.2022.
//

import Foundation
import UIKit

final class Checker {
    
    static let shared = Checker()
    private init() {}
    
  private  let login: String = "U"
   private  let password: String = "p"

    
    func check( login:String, password: String) -> Bool {
      return  login == Checker.shared.login && password == Checker.shared.password
    }
}

protocol LoginViewControllerDelegate {
   func check( login:String, password: String) -> Bool
   
}

struct LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        login == login && password == password
    }
}

protocol Loginfactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory:Loginfactory {
    func makeLoginInspector() -> LoginInspector {
        LoginInspector()
        }
    }

