//
//  ThirdViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 5/10/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ThirdViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var contentInput: UITextView!
    
    var firData = FirData()
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoneButton(_ sender: Any) {
        
//        func randomString(length: Int) -> String {
//            
//            let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//            let len = UInt32(letters.length)
//            
//            var randomString = ""
//            
//            for _ in 0 ..< length {
//                let rand = arc4random_uniform(len)
//                var nextChar = letters.character(at: Int(rand))
//                randomString += NSString(characters: &nextChar, length: 1) as String
//            }
//            
//            return randomString
//        }
//        let noteID = randomString(length: 21)
//        let postRef = databaseRef.child("Notes").child("\(noteID)")
//        
//        var title = String()
//        if titleInput.text == "" {
//            titleInput.text = "No Title"
//            title = titleInput.text!
//        }else{
//            title = titleInput.text!
//        }
//        
//        var content = String()
//        if contentInput.text == "" {
//            contentInput.text = "No Content"
//            content = contentInput.text!
//        }else{
//            content = contentInput.text!
//        }
//        
//        let post = postStruct(title: title, content: content)
//        
//        postRef.setValue(post.toAnyObject())
        
        let title:String! = titleInput.text!
        let content:String! = contentInput.text!
        
        firData.addData(titleInput: title, contentInput: content)
        
       _ = navigationController?.popViewController(animated: true)
    }
}
