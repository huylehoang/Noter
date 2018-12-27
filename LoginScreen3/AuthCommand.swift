//
//  AuthCommand.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/27/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol AuthCommand {
    func execute(email: String?, password: String?, userName: String?, _ completion: (()->())?)
}

struct LoginCommand: AuthCommand {
    func execute(email: String?, password: String?, userName: String?, _ completion: (() -> ())?) {
        let loginProxy = LoginProxy()
        loginProxy.login(with: email, and: password) {
            completion?()
        }
    }
}

struct RegisterCommand: AuthCommand {
    func execute(email: String?, password: String?, userName: String?, _ completion: (() -> ())?) {
        RegisterFacade.register(with: email, password, and: userName) {
            completion?()
        }
    }
}

struct LogOutCommand {
    func execute(_ completion: (()->())?) {
        let logOutProxy = LogOutProxy()
        logOutProxy.logOut {
            completion?()
        }
    }
}
