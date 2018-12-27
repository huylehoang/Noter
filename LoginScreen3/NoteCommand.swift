//
//  NoteCommand.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/27/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation
import Firebase

protocol NoteCommand {
    var databaseRef: FIRDatabaseReference! {get}
    func execute(with key: String?, title: String?, content: String?)
}

struct AddNoteCommand: NoteCommand {
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    init() {}
    
    func execute(with key: String?, title: String?, content: String?) {
        
        let noteID = Helper.randomString(length: 21)
        let postRef = databaseRef.child("Notes").child("\(noteID)")
        let currentDate = Date().millisecondsTimestamp()
        let input = Helper.handleInput(title: title, content: content)
        let post = postStruct(title: input.title, content: input.content, date: currentDate)
        
        postRef.setValue(post.toAnyObjectForAdding())
    }
}

struct UpdateNoteCommand: NoteCommand {
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    init() {}
    
    func execute(with key: String?, title: String?, content: String?) {
        let input = Helper.handleInput(title: title, content: content)
        let updatePost = postStruct(title: input.title, content: input.content)
        
        if let key = key, key != "" {
            let updateRef = databaseRef.child("/Notes/\(key)")
            updateRef.updateChildValues(updatePost.toAnyObjectForUpdating())
        } else {
            return
        }
    }
}
