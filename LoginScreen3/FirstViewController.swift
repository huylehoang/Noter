//
//  FirstViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 5/2/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirstViewController: UIViewController {

    @IBOutlet weak var nameRegister: UITextField!
    @IBOutlet weak var passwordRegister: UITextField!
    @IBOutlet weak var emailRegister: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet var SignUpView: UIView!
    @IBOutlet var LoginView: UIView!
    @IBOutlet weak var Controller: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LoginView.isHidden = false
        self.SignUpView.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ChangeView(_ sender: UISegmentedControl) {
        if Controller.selectedSegmentIndex == 0 {
            self.LoginView.isHidden = false
            self.SignUpView.isHidden = true
            nameRegister.text = ""
            passwordRegister.text = ""
            emailRegister.text = ""
            txtEmail.text = ""
            txtPassword.text = ""
        }
        if Controller.selectedSegmentIndex == 1 {
            self.LoginView.isHidden = true
            self.SignUpView.isHidden = false
            nameRegister.text = ""
            passwordRegister.text = ""
            emailRegister.text = ""
            txtEmail.text = ""
            txtPassword.text = ""
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "moveToSecondVC" {
////            let destination = segue.destination as! SecondViewController
//            let destinationNavigationController = segue.destination as! UINavigationController
//            let targetController = destinationNavigationController.topViewController as! SecondViewController
//            targetController.text2nd = txtEmail.text
//        }
//    }


    @IBAction func Login(_ sender: Any) {
        let alert = UIAlertController(title: "Wrong Email or Password", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        let alert1 = UIAlertController(title: "Missing Email or Password", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        
        let emailInput = txtEmail.text
        let passInput = txtPassword.text
        
        if emailInput!.isEmpty || passInput!.isEmpty {
            self.present(alert1, animated: true, completion:nil)
        }
        
        if let email = emailInput, let password = passInput {
            FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "moveToSecondVC", sender: self)
                } else {
                    self.present(alert, animated: true, completion:nil)
                }
            }
        }
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        let alert3 = UIAlertController(title: "Missing Information", message: "Please fill in the empty box", preferredStyle:UIAlertControllerStyle.alert)
        alert3.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        let alert4 = UIAlertController(title: "Account Registration Successful", message: "Congratulation", preferredStyle:UIAlertControllerStyle.alert)
        alert4.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        let alert5 = UIAlertController(title: "Something Went Wrong", message: "Please type again", preferredStyle:UIAlertControllerStyle.alert)
        alert5.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        let emailSignUp = emailRegister.text
        let passSignUp = passwordRegister.text
        let nameSignUp = nameRegister.text
        
        if emailSignUp!.isEmpty || passSignUp!.isEmpty || nameSignUp!.isEmpty{
            self.present(alert3, animated: true, completion:nil)
        }
        
        if let email = emailSignUp, let password = passSignUp {
            FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    self.present(alert5, animated: true, completion:nil)
                } else {
                    self.present(alert4, animated: true, completion:nil)
                }
            }
        }
    }
}
