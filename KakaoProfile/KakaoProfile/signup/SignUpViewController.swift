//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/19.
//

import UIKit


class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var idTextEdit: SignUpTextField!
    @IBOutlet var passwordTextEdit: SignUpTextField!
    @IBOutlet var confirmPasswordTextEdit: SignUpTextField!
    @IBOutlet var nameTextEdit: SignUpTextField!
    @IBOutlet var idAlertLabel: UILabel!
    @IBOutlet var passwordAlertLabel: UILabel!
    @IBOutlet var confirmPasswordAlertLabel: UILabel!
    @IBOutlet var nameAlertLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextEdit.placeholder = SignUpPlaceholder.ID.rawValue
        passwordTextEdit.placeholder = SignUpPlaceholder.PASSWORD.rawValue
        
        idTextEdit.start()
        passwordTextEdit.start()
        confirmPasswordTextEdit.start()
        nameTextEdit.start()
        
        idTextEdit.delegate = self
        passwordTextEdit.delegate = self
        confirmPasswordTextEdit.delegate = self
        nameTextEdit.delegate = self
        
        idAlertLabel.text = ""
        passwordAlertLabel.text = ""
        confirmPasswordAlertLabel.text = ""
        nameAlertLabel.text = ""
        
    }
    @IBAction func idInputDidEnd(_ sender: SignUpTextField) {
        if let id = sender.text, User.isValidId(id: id) {
            sender.toBasicMode()
        } else {
            sender.toAlertMode()
        }
    }
    @IBAction func passwordInputDidEnd(_ sender: SignUpTextField) {
        if let password = sender.text, User.isValidPassword(password: password, patterns: [.CAPITAL, .LENGTH, .NUMBER, .SPECIAL]) {
            sender.toBasicMode()
        } else {
            sender.toAlertMode()
        }
        
    }
    @IBAction func confirmPasswordInputDidEnd(_ sender: SignUpTextField) {
        if let confirmPassword = sender.text, confirmPassword == passwordTextEdit.text {
            sender.toBasicMode()
        } else {
            sender.toAlertMode()
        }
    }
    @IBAction func nameInputDidEnd(_ sender: SignUpTextField) {
        if let name = sender.text, !name.isEmpty {
            sender.toBasicMode()
        } else {
            sender.toAlertMode()
            nameAlertLabel.text = SignUpAlertMessage.NAME_EMPTY.rawValue
            nameAlertLabel.textColor = UIColor.red
            nameAlertLabel.isHidden = false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
}

extension SignUpViewController {
    
    @IBAction func passwordInputChanged(_ sender: UITextField) {
        guard let password = sender.text, !password.isEmpty else {
            return
        }
        passwordAlertLabel.isHidden = false
        
        if !User.isValidPassword(password: password, patterns: [.LENGTH]) {
            passwordAlertLabel.text = SignUpAlertMessage.PASSWORD_WRONG_LENGTH.rawValue
            passwordAlertLabel.textColor = UIColor.red
        } else if !User.isValidPassword(password: password, patterns: [.CAPITAL]) {
            passwordAlertLabel.text = SignUpAlertMessage.PASSWORD_NO_CAPITAL.rawValue
            passwordAlertLabel.textColor = UIColor.red
        } else if !User.isValidPassword(password: password, patterns: [.NUMBER]) {
            passwordAlertLabel.text = SignUpAlertMessage.PASSWORD_NO_NUMBER.rawValue
            passwordAlertLabel.textColor = UIColor.red
        } else if !User.isValidPassword(password: password, patterns: [.SPECIAL]) {
            passwordAlertLabel.text = SignUpAlertMessage.PASSWORD_NO_SPECIAL.rawValue
            passwordAlertLabel.textColor = UIColor.red
        } else {
            passwordAlertLabel.text = SignUpAlertMessage.VALID_PASSWORD.rawValue
            passwordAlertLabel.textColor = UIColor.green
        }
    }
    
    @IBAction func idInputChanged(_ sender: UITextField) {
        guard let id = sender.text, !id.isEmpty else {
            return
        }
        idAlertLabel.isHidden = false
        
        if !User.isValidId(id: id) {
            idAlertLabel.text = SignUpAlertMessage.INVALID_ID.rawValue
            idAlertLabel.textColor = UIColor.red
        } else {
            idAlertLabel.text = SignUpAlertMessage.VALID_ID.rawValue
            idAlertLabel.textColor = UIColor.green
        }
    }
    
    
    @IBAction func confirmPasswordInputChanged(_ sender: UITextField) {
        guard let password = passwordTextEdit.text,
            let confirmPassword = confirmPasswordTextEdit.text,
            !confirmPassword.isEmpty else {
            return
        }
        confirmPasswordAlertLabel.isHidden = false

        if password == confirmPassword {
            confirmPasswordAlertLabel.text = SignUpAlertMessage.VALID_CONFIRM_PASSWORD.rawValue
            confirmPasswordAlertLabel.textColor = UIColor.green
        } else {
            confirmPasswordAlertLabel.text = SignUpAlertMessage.CONFIRM_PASSWORD_NOT_MATCH.rawValue
            confirmPasswordAlertLabel.textColor = UIColor.red
        }
    }
    
    
    @IBAction func doneButtonTouched(_ sender: UIButton) {
        
        guard let id = idTextEdit.text, User.isValidId(id: id) else {
            return
        }
        guard let password = passwordTextEdit.text, User.isValidPassword(password: password, patterns: [.SPECIAL, .NUMBER, .LENGTH, .CAPITAL]) else {
            return
        }
        guard let confirmPassword = confirmPasswordTextEdit.text, password == confirmPassword else {
            return
        }
        guard let name = nameTextEdit.text, !name.isEmpty else {
            return
        }
        
    
        if let data = User(id: idTextEdit.text!, password: passwordTextEdit.text!).toJson() {
            signUpRequest(data: data)
        }
//        self.dismiss(animated: true, completion: nil)
    }
}
