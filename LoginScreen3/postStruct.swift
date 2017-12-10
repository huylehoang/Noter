//
//  postStruct.swift
//  LoginScreen3
//
//  Created by LeeX on 6/6/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct postStruct {
    
    var title : String!
    var content : String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    init(title: String, content: String, key: String = "") {
        self.title = title
        self.content = content
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot) {
        self.title = (snapshot.value as? NSDictionary)?["title"] as? String ?? ""
        self.content = (snapshot.value as? NSDictionary)?["content"] as? String ?? ""
        self.key = snapshot.key
        self.ref = snapshot.ref
    }
    
    func toAnyObject() -> [String: AnyObject] {
        return ["title" : title as AnyObject, "content" : content as AnyObject]
    }
}

