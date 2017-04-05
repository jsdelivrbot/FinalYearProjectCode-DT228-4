//
//  SignUpViewController.swift
//  QuickLoginViewController
//
//  Created by Stephen Fox on 07/09/2016.
//  Copyright © 2016 Stephen Fox. All rights reserved.
//

import UIKit
import FontAwesome_swift
import Cartography

protocol SignUpViewControllerDelegate: class {
  func signUpDetailsEntered(_ viewController: SignUpViewController,
                            email: String,
                            fullname: String,
                            password: String)
}


class SignUpViewController: QuickViewController {
  
  weak var delegate: SignUpViewControllerDelegate?
  fileprivate var emailTextField: QTextField!
  fileprivate var fullnameTextField: QTextField!
  fileprivate var passwordTextField: QTextField!
  fileprivate var signUpButton: QButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.clear
    self.setUpViews()
  }
  
  
  fileprivate func setUpViews() {  
    // Add email textfield
    self.emailTextField = QTextField(fontAwesome: String.fontAwesomeIconWithCode("fa-envelope")!)
    self.emailTextField.field?.placeholder = "Email"
    self.emailTextField.field?.autocorrectionType = .no
    self.emailTextField.field?.autocapitalizationType = .none
    self.view.addSubview(self.emailTextField)
    
    // Add fullname textfield
    self.fullnameTextField = QTextField(fontAwesome: String.fontAwesomeIconWithCode("fa-user")!);
    self.fullnameTextField.field?.placeholder = "Full Name"
    self.fullnameTextField.field?.autocorrectionType = .no
    self.fullnameTextField.field?.autocapitalizationType = .none
    self.view.addSubview(self.fullnameTextField)
    
    // Add password textfield
    self.passwordTextField = QTextField(fontAwesome: String.fontAwesomeIconWithCode("fa-lock")!);
    passwordTextField.field?.placeholder = "Password"
    passwordTextField.field?.isSecureTextEntry = true
    self.view.addSubview(self.passwordTextField)
    
    self.signUpButton = QButton()
    self.signUpButton.addTarget(self, action: #selector(SignUpViewController.notifyDelegate), for: .touchUpInside)
    self.signUpButton.setTitle("SIGN UP", for: UIControlState())
    self.signUpButton.addTextSpacing(2.0)
    self.view.addSubview(self.signUpButton)
    
    constrain(self.view, self.emailTextField, self.fullnameTextField, self.passwordTextField, self.signUpButton) {
      (superView, emailTextField, fullnameTextField, passwordTextField, signUpButton) in
      emailTextField.centerX == superView.centerX
      emailTextField.top == superView.top + 200
      emailTextField.width == 300
      emailTextField.height == 50
      
      fullnameTextField.centerX == superView.centerX
      fullnameTextField.top == superView.top + 270
      fullnameTextField.width == 300
      fullnameTextField.height == 50
      
      passwordTextField.centerX == superView.centerX
      passwordTextField.top == superView.top + 340
      passwordTextField.width == 300
      passwordTextField.height == 50
      
      signUpButton.centerX == superView.centerX
      signUpButton.top == superView.top + 410
      signUpButton.width == 300
      signUpButton.height == 50
    }
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  /// Notify delegate of details entered by user.
  @objc fileprivate func notifyDelegate() {
    var email: String?
    var fullname: String?
    var password: String?
    
    if let efield = self.emailTextField.field {
      if efield.text != nil {
        email = efield.text
      }
    }
    if let ffield = self.fullnameTextField.field {
      if ffield.text != nil {
        fullname = ffield.text
      }
    }
    if let pfield = self.passwordTextField.field {
      if pfield.text != nil {
        password = pfield.text
      }
    }
    if email!.isEmpty || fullname!.isEmpty || password!.isEmpty {
      return super.displayMessage(title: "Error", message: "Please fill in all fields")
    }
    else if let delegate = self.delegate {
      delegate.signUpDetailsEntered(self, email: email!, fullname: fullname!, password: password!)
    }
  }
}
