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
        
        idTextEdit.validateContent = {
            if let id = self.idTextEdit.text, User.isValidId(id: id) {
                return true
            } else {
                return false
            }
        }
        
        passwordTextEdit.validateContent = {
            if let password = self.passwordTextEdit.text,
               User.isValidPassword(password: password, patterns: [.SPECIAL, .NUMBER, .LENGTH, .CAPITAL]) {
                return true
            } else {
                return false
            }
        }
        
        confirmPasswordTextEdit.validateContent = {
            if let confirmPassword = self.confirmPasswordTextEdit.text,
               confirmPassword == self.passwordTextEdit.text {
                return true
            } else {
                return false
            }
        }
        
        nameTextEdit.validateContent = {
            if let name = self.nameTextEdit.text, !name.isEmpty {
                return true
            } else {
                return false
            }
        }
        
        idTextEdit.delegate = self
        passwordTextEdit.delegate = self
        confirmPasswordTextEdit.delegate = self
        nameTextEdit.delegate = self
        
        idAlertLabel.text = ""
        passwordAlertLabel.text = ""
        confirmPasswordAlertLabel.text = ""
        nameAlertLabel.text = ""
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let sender = textField as? SignUpTextField else {
            return
        }
        sender.changeModeTo(mode: .WRITING)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let sender = textField as? SignUpTextField else {
            return
        }
        if let hasValidateContent = sender.validateContent, hasValidateContent() {
            sender.changeModeTo(mode: .NORMAL)
        } else {
            sender.changeModeTo(mode: .ALERT)
        }
    }
    @IBAction func idEditingChanged(_ sender: UITextField) {
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
    
    
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
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
    
    @IBAction func confirmPasswordEditingChanged(_ sender: UITextField) {
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
    
    @IBAction func nameEditingChanged(_ sender: SignUpTextField) {
        if let name = sender.text, name.isEmpty {
            nameAlertLabel.text = SignUpAlertMessage.NAME_EMPTY.rawValue
            nameAlertLabel.textColor = UIColor.red
            nameAlertLabel.isHidden = false
        } else {
            nameAlertLabel.isHidden = true
        }
    }
    
}

extension SignUpViewController {
    
    @IBAction func doneButtonTouched(_ sender: UIButton) {
        guard let hasValidId = idTextEdit.validateContent, hasValidId(),
              let hasValidPassword = passwordTextEdit.validateContent, hasValidPassword(),
              let hasValidConfirmPassword = confirmPasswordTextEdit.validateContent, hasValidConfirmPassword(),
              let hasValidName = nameTextEdit.validateContent, hasValidName() else {
                  return
              }
    
        if let data = User(id: idTextEdit.text!, password: passwordTextEdit.text!).toJson() {
            signUpRequest(data: data)
        }
//        self.dismiss(animated: true, completion: nil)
    }
}
