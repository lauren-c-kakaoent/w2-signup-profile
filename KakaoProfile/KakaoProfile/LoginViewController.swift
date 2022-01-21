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
    @IBOutlet var clearIdButton: UIButton!
    @IBOutlet var clearPasswordButton: UIButton!
    
    let realId = "1234"
    let realPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearIdButton.isHidden = true
        clearPasswordButton.isHidden = true
        // [DEBUG]
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "password")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !hasSignUpBefore() {
            self.performSegue(withIdentifier: "showSignUp", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? SignUpViewController {
            destination.modalPresentationStyle = .custom
            destination.transitioningDelegate = self
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
        if let _ = UserDefaults.standard.string(forKey: "id"), let _ = UserDefaults.standard.string(forKey: "password") {
            return true
        }
        return false
    }
    
    
    
}
extension LoginViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            
            let fromView = transitionContext.viewController(forKey: .from)!.view!
            
            let size = CGSize(
                width: UIScreen.main.bounds.size.width,
                height: UIScreen.main.bounds.size.height)
            
            
            let offScreenFrame = CGRect(origin: CGPoint(x: size.width * -1, y:0), size: size)
            let onScreenFrame = CGRect(origin: .zero, size: size)
            
            fromView.frame = onScreenFrame
            
            let animationDuration = transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: animationDuration, animations: {
                fromView.frame = offScreenFrame
            }, completion: { (success) in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
