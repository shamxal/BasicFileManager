//
//  SignupController.swift
//  FileManagerApp
//
//  Created by Shamkhal Guliyev on 16.07.22.
//

struct User: Codable {
    let fullname: String
    let password: String
    let email: String
}

import UIKit

class SignupController: UIViewController {
    
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let fileManager = FileManagerHelper.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileManager.readJsonFile()
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let fullname = fullnameTextField.text, let password = passwordTextField.text {
            let user = User(fullname: fullname, password: password, email: email)
            fileManager.users.append(user)
            fileManager.writeToJsonFile { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        } else {
            print("fill the information")
        }
    }
}
