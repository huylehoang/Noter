//
//  Command.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/26/18.
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

protocol NoteCommand {
    var databaseRef: FIRDatabaseReference! {get}
    func execute(with key: String, title: String?, content: String?)
}

struct AddNoteCommand: NoteCommand {
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    init() {}
    
    func execute(with key: String, title: String?, content: String?) {
        
        let noteID = Helper.randomString(length: 21)
        let postRef = databaseRef.child("Notes").child("\(noteID)")
        
        let input = Helper.handleInput(title: title, content: content)
        let post = postStruct(title: input.title, content: input.content)
        
        postRef.setValue(post.toAnyObject())
    }
}

struct UpdateNoteCommand: NoteCommand {
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    init() {}
    
    func execute(with key: String, title: String?, content: String?) {
        let input = Helper.handleInput(title: title, content: content)
        let updatePost = postStruct(title: input.title, content: input.content)
        let updateRef = databaseRef.child("/Notes/\(key)")
        updateRef.updateChildValues(updatePost.toAnyObject())
    }
}
