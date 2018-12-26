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
                newPosts.append(newPostStruct)
            }
            posts = newPosts
            self.delegate?.didReceiveData(data: posts)
        })
    }
}

