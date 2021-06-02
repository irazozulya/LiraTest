//
//  RegisterManager.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//

import GameKit
import Combine

final class RegisterManager: ObservableObject {
    init() { }
    
    func isAccessible(email: String?, password: String?) -> Bool {
        
        return User.isAccessible(email: email, password: password)
    }
    
    func register(name: String?, email: String?, password: String?) -> Bool {
        
        return User.register(name: name, email: email, password: password)
    }
}
