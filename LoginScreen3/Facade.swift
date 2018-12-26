//
//  Facade.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/26/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation

class RegisterFacade {
    static func register(with email: String?, _ password: String?, and userName: String?, _ completion: (()->())? = nil) {
        let registerProxy = RegisterProxy()
        registerProxy.register(with: email, password, and: userName) { (name, user) in
            let changeUserNameProxy = ChangeUserNameProxy()
            changeUserNameProxy.changeUser(name, with: user) {
                completion?()
            }
        }
    }
}
