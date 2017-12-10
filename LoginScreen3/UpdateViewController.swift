//
//  UpdateViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 6/9/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UpdateViewController: UIViewController {

    @IBOutlet weak var titleInputUpdate: UITextField!
    @IBOutlet weak var contentInputUpdate: UITextView!
    
    var todo: postStruct!
    var firData = FirData()
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleInputUpdate.text = todo.title
        contentInputUpdate.text = todo.content
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoneButtonUpdate(_ sender: Any) {
        
//        var title = String()
//        if titleInputUpdate.text == "" {
//            titleInputUpdate.text = "No Title"
//            title = titleInputUpdate.text!
//        }else{
//            title = titleInputUpdate.text!
//        }
//        
//        var content = String()
//        if contentInputUpdate.text == "" {
//            contentInputUpdate.text = "No Content"
//            content = contentInputUpdate.text!
//        }else{
//            content = contentInputUpdate.text!
//        }
//        
//        let updatedPost = postStruct(title: title, content: content)
//        
//        let key = todo.ref!.key
//        
//        let updateRef = databaseRef.child("/Notes/\(key)")
//        
//        updateRef.updateChildValues(updatedPost.toAnyObject())
        
        let title:String! = titleInputUpdate.text!
        let content:String! = contentInputUpdate.text!
        
        firData.updateData(titleInputUpdate: title, contentInputUpdate: content)
        
        _ = navigationController?.popViewController(animated: true)
    }
}
