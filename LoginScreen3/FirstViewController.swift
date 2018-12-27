//
//  FirstViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 5/2/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit

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
            showLoginView()
        }
        if Controller.selectedSegmentIndex == 1 {
            showSignUpView()
        }
    }
    
    private func showLoginView() {
        self.LoginView.isHidden = false
        self.SignUpView.isHidden = true
        nameRegister.text = ""
        passwordRegister.text = ""
        emailRegister.text = ""
        txtEmail.text = ""
        txtPassword.text = ""
    }
    
    private func showSignUpView() {
        self.LoginView.isHidden = true
        self.SignUpView.isHidden = false
        nameRegister.text = ""
        passwordRegister.text = ""
        emailRegister.text = ""
        txtEmail.text = ""
        txtPassword.text = ""
    }

    @IBAction func Login(_ sender: Any) {
        let emailInput = txtEmail.text
        let passInput = txtPassword.text
        
        let loginCommand = LoginCommand()
        loginCommand.execute(email: emailInput, password: passInput, userName: "") { [unowned self] in
            self.performSegue(withIdentifier: "moveToSecondVC", sender: self)
        }
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        let emailSignUp = emailRegister.text
        let passSignUp = passwordRegister.text
        let nameSignUp = nameRegister.text
        
        let registerCommand = RegisterCommand()
        registerCommand.execute(email: emailSignUp, password: passSignUp, userName: nameSignUp) {
            DispatchQueue.main.async { [unowned self] in
                self.Controller.selectedSegmentIndex = 0
                self.showLoginView()
            }
        }
    }
}
