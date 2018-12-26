//
//  Helper.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/26/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    static func showAlert(with title: String, message: String, _ completion: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            completion?()
        }
        alert.addAction(action)
        
        if let topVC = UIApplication.getTopMostViewController() {
            topVC.present(alert, animated: true, completion: nil)
        }
    }
    
    static func randomString(length: Int) -> String {
        
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
    
    static func handleInput(title: String?, content: String?) -> (title: String, content: String) {
        var tmpTitle = String()
        if let titleInput = title {
            if titleInput == "" {
                tmpTitle = "No Title"
            }else{
                tmpTitle = titleInput
            }
        } else {
            tmpTitle = "No Title"
        }
        
        
        var tmpContent = String()
        if let contentInput = content {
            if contentInput == "" {
                tmpContent = "No Content"
            }else{
                tmpContent = contentInput
            }
        } else {
            tmpContent = "No Content"
        }
        
        return (title: tmpTitle, content: tmpContent)
    }
    
}
