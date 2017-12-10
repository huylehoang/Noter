//
//  viewNote.swift
//  LoginScreen3
//
//  Created by LeeX on 6/12/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol Delegate: class {
    func didReceiveData(data: [postStruct])
}

class FirData {
    
    var delegate: Delegate?
    
    var todo1: postStruct!
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    func fetchData(){
        var posts:[postStruct] = []
        let databaseRefs = databaseRef.child("Notes")
        
        databaseRefs.queryOrderedByKey().observe(FIRDataEventType.value, with: { (snapshot) in
            var newPosts = [postStruct]()
            
            for item in snapshot.children {
                let newPostStruct = postStruct(snapshot: item as! FIRDataSnapshot)
                newPosts.insert(newPostStruct, at: 0)
            }
            posts = newPosts
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            self.delegate?.didReceiveData(data: posts)
        })
    }
    
    func addData( titleInput: String, contentInput: String ) {
        func randomString(length: Int) -> String {
            
            let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let len = UInt32(letters.length)
            
            var randomString = ""
            
            for _ in 0 ..< length {
                let rand = arc4random_uniform(len)
                var nextChar = letters.character(at: Int(rand))
                randomString += NSString(characters: &nextChar, length: 1) as String
            }
            
            return randomString
        }
        let noteID = randomString(length: 21)
        let postRef = databaseRef.child("Notes").child("\(noteID)")
        
        var title = String()
        if titleInput == "" {
            let titleInput = "No Title"
            title = titleInput
        }else{
            title = titleInput
        }
        
        var content = String()
        if contentInput == "" {
            let contentInput = "No Content"
            content = contentInput
        }else{
            content = contentInput
        }
        
        let post = postStruct(title: title, content: content)
        
        postRef.setValue(post.toAnyObject())
    }
    
    func updateData( titleInputUpdate: String, contentInputUpdate: String ) {
        var title = String()
        if titleInputUpdate == "" {
            let titleInputUpdate = "No Title"
            title = titleInputUpdate
        }else{
            title = titleInputUpdate
        }
        
        var content = String()
        if contentInputUpdate == "" {
            let contentInputUpdate = "No Content"
            content = contentInputUpdate
        }else{
            content = contentInputUpdate
        }
        
        let updatedPost = postStruct(title: title, content: content)
        
        let key = todo1.ref!.key
        
        let updateRef = databaseRef.child("/Notes/\(key)")
        
        updateRef.updateChildValues(updatedPost.toAnyObject())
    }
}

