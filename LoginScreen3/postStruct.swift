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
    var date: Int64!
    
    init(title: String, content: String, date: Int64 = 0, key: String = "") {
        self.title = title
        self.content = content
        self.date = date
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot: FIRDataSnapshot) {
        self.title = (snapshot.value as? NSDictionary)?["title"] as? String ?? ""
        self.content = (snapshot.value as? NSDictionary)?["content"] as? String ?? ""
        self.date = (snapshot.value as? NSDictionary)?["date"] as? Int64 ?? 0
        self.key = snapshot.key
        self.ref = snapshot.ref
    }
    
    func toAnyObjectForAdding() -> [String: AnyObject] {
        return ["title" : title as AnyObject, "content" : content as AnyObject, "date" : date as AnyObject]
    }
    
    func toAnyObjectForUpdating() -> [String: AnyObject] {
        return ["title" : title as AnyObject, "content" : content as AnyObject]
    }
}

