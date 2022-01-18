//
//  ViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/17.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var idTextEdit: UITextField!
    @IBOutlet var passwordTextEdit: UITextField!
    
    let realId = "lauren.c"
    let realPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTouched(_ sender: UIButton) {
        let inputId = idTextEdit.text
        let inputPassword = passwordTextEdit.text
        
        if isValidLoginForm(id: inputId, password: inputPassword) {
            
        }
    }
    
    private func isValidLoginForm(id: String?, password: String?) -> Bool {
        return id == self.realId && password == self.realPassword
    }
    
}

