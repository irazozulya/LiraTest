//
//  LoginManager.swift
//  LiraTech
//
//  Created by Ira Zozulya on 31.05.2021.
//

import Combine

final class LoginManager: ObservableObject {
    init() { }
    
    func isAccessible(email: String?, password: String?) -> Bool {
        
        return User.isAccessible(email: email, password: password)
    }
}
