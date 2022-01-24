//
//  SignUpTextEdit.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/20.
//

import UIKit

enum SignUpTextFieldMode {
    case NORMAL, WRITING, ALERT
}

class SignUpTextField: UITextField {
    
    var validateContent: (() -> Bool)?
    
    func start() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
    }
    
    func changeModeTo(mode: SignUpTextFieldMode) {
        switch mode {
        case .NORMAL:
            self.layer.borderColor = UIColor.black.cgColor
        case .ALERT:
            self.layer.borderColor = UIColor.red.cgColor
        case .WRITING:
            self.layer.borderColor = UIColor.blue.cgColor
            
        }
        
    }
}
