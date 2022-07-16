//
//  LoginController.swift
//  UserFileManagerApp
//
//  Created by Shamkhal Guliyev on 16.07.22.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let fileManager = FileManagerHelper.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileManager.readJsonFile()
    }
    
    func checkUser() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            for user in fileManager.users {
                if user.email == email && user.password == password {
                    print("user logged in")
                }
            }
        } else {
            print("fill the information")
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        checkUser()
    }
}
