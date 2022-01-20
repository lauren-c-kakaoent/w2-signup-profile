//
//  SignUpTextEdit.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/20.
//

import UIKit

class SignUpTextField: UITextField {
    
    func start() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
    }
    
    func toAlertMode() {
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func toBasicMode() {
        self.layer.borderColor = UIColor.black.cgColor
    }
}
