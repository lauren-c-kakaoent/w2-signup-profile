//
//  ViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/17.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet var idTextEdit: UITextField!
    @IBOutlet var passwordTextEdit: UITextField!
    @IBOutlet var clearIdButton: UIButton!
    @IBOutlet var clearPasswordButton: UIButton!
    
    let realId = "1234"
    let realPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearIdButton.isHidden = true
        clearPasswordButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !hasSignUpBefore() {
            self.performSegue(withIdentifier: "showSignUp", sender: self)
        }
    }

    private func isValidLoginForm(id: String?, password: String?) -> Bool {
        return id == self.realId && password == self.realPassword
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showNews" {
            let inputId = idTextEdit.text
            let inputPassword = passwordTextEdit.text
            return isValidLoginForm(id: inputId, password: inputPassword)
        }
        return true
    }
    
    @IBAction func clearIdButtonTouched(_ sender: UIButton) {
        idTextEdit.text = ""
        clearIdButton.isHidden = true
    }
    @IBAction func clearPasswordButtonTouched(_ sender: UIButton) {
        passwordTextEdit.text = ""
        clearPasswordButton.isHidden = true
    }
    @IBAction func idInputChanged(_ sender: UITextField) {
        clearIdButton.isHidden = idTextEdit.text?.isEmpty ?? true
    }
    @IBAction func passwordInputChanged(_ sender: UITextField) {
        clearPasswordButton.isHidden = passwordTextEdit.text?.isEmpty ?? true
    }
    
    private func hasSignUpBefore() -> Bool {
        return false
    }
    
}
