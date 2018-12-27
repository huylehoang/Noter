//
//  Proxy.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/26/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation
import FirebaseAuth

public struct LoginProxy {
    public func login(with email: String?, and password: String?, _ completion: (()->())? = nil) {
        if let email = email, let password = password {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    Helper.showAlert(with: "\(error.localizedDescription)", message: "Please type again")
                } else {
                    if let userName = user?.displayName {
                        Helper.showAlert(with: "Welcome \(userName)", message: "", {
                            completion?()
                        })
                    }
                }
            })
        }
    }
}

public struct RegisterProxy {
    public func register(with email: String?, _ password: String?, and userName: String?, _ completion: ((String, FIRUser)->())? = nil) {
        if let email = email, let password = password, let userName = userName {
            if userName == "" {
                Helper.showAlert(with: "Missing Information", message: "Please type again")
                return
            }
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    Helper.showAlert(with: "\(error.localizedDescription)", message: "Please type again")
                } else {
                    if let user = user {
                        completion?(userName, user)
                    }
                }
            })
        }
    }
}

public struct ChangeUserNameProxy {
    public func changeUser(_ name: String, with user: FIRUser, _ completion: (()->())? = nil) {
        let changeRequest = user.profileChangeRequest()
        changeRequest.displayName = name
        changeRequest.commitChanges { (error) in
            if let error = error {
                Helper.showAlert(with: "\(error.localizedDescription)", message: "Please type again")
            } else {
                Helper.showAlert(with: "Account Registration Successfull", message: "Congratulation") {
                    completion?()
                }
            }
        }
    }
}

public struct LogOutProxy {
    public func logOut(_ completion: (()->())?) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            completion?()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
