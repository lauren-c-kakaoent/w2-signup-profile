//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/19.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var idTextEdit: UITextField!
    @IBOutlet var passwordTextEdit: UITextField!
    @IBOutlet var confirmPasswordTextEdit: UITextField!
    @IBOutlet var nameTextEdit: UITextField!
    @IBOutlet var idAlertLabel: UILabel!
    @IBOutlet var passwordAlertLabel: UILabel!
    @IBOutlet var confirmPasswordAlertLabel: UILabel!
    @IBOutlet var nameAlertLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextEdit.placeholder = "영문 소문자, 숫자, 특수기호(_,-) 5~20자"
        passwordTextEdit.placeholder = "영문 대/소문자, 숫자, 특수문자(!@#$%) 8~16자"
        
        idAlertLabel.text = ""
        passwordAlertLabel.text = ""
        confirmPasswordAlertLabel.text = ""
        nameAlertLabel.text = ""
    }
    
    @IBAction func idInputChanged(_ sender: UITextField) {
        guard let id = sender.text, !id.isEmpty else {
            idAlertLabel.isHidden = true
            return
        }
        idAlertLabel.isHidden = false
        
        if !User.isValidId(id: id) {
            idAlertLabel.text = "5~20자의 영문 소문자, 숫자와 특수기호_,- 만 사용 가능합니다."
            idAlertLabel.textColor = UIColor.red
        } else {
            idAlertLabel.text = "사용 가능한 아이디입니다."
            idAlertLabel.textColor = UIColor.green
        }
    }
    
    @IBAction func passwordInputChanged(_ sender: UITextField) {
        guard let password = sender.text, !password.isEmpty else {
            passwordAlertLabel.isHidden = true
            return
        }
        passwordAlertLabel.isHidden = false
        
        if !User.isValidPassword(password: password, patterns: [.LENGTH]) {
            passwordAlertLabel.text = "8자 이상 16자 이하로 입력해주세요."
            passwordAlertLabel.textColor = UIColor.red
        } else if !User.isValidPassword(password: password, patterns: [.CAPITAL]) {
            passwordAlertLabel.text = "영문 대문자를 최소 1자 이상 포함해주세요."
            passwordAlertLabel.textColor = UIColor.red
        } else if !User.isValidPassword(password: password, patterns: [.NUMBER]) {
            passwordAlertLabel.text = "숫자를 최소 1자 이상 포함해주세요."
            passwordAlertLabel.textColor = UIColor.red
        } else if !User.isValidPassword(password: password, patterns: [.SPECIAL]) {
            passwordAlertLabel.text = "특수문자를 최소 1자 이상 포함해주세요."
            passwordAlertLabel.textColor = UIColor.red
        } else {
            passwordAlertLabel.text = "안전한 비밀번호입니다."
            passwordAlertLabel.textColor = UIColor.green
        }
    }
    
    @IBAction func confirmPasswordInputChanged(_ sender: UITextField) {
        
        guard let password = passwordTextEdit.text,
            let confirmPassword = confirmPasswordTextEdit.text,
            !confirmPassword.isEmpty else {
                
            confirmPasswordAlertLabel.isHidden = true
            return
        }
        confirmPasswordAlertLabel.isHidden = false

        if password == confirmPassword {
            confirmPasswordAlertLabel.text = "비밀번호가 일치합니다."
            confirmPasswordAlertLabel.textColor = UIColor.green
        } else {
            confirmPasswordAlertLabel.text = "비밀번호가 일치하지 않습니다."
            confirmPasswordAlertLabel.textColor = UIColor.red
        }
    }
    

}
