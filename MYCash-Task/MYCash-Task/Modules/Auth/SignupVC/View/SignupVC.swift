//
//  SignupVC.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//

import UIKit

class SignupVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var nameTextField: StyledTextField!
    @IBOutlet private weak var emailTextField: StyledTextField!
    @IBOutlet private weak var phoneNumberTextField: StyledTextField!
    @IBOutlet private weak var passwordTextField: StyledPasswordTextField!
    @IBOutlet private weak var confirmPasswordTextField: StyledPasswordTextField!
    @IBOutlet private weak var spacerView: UIView!
    @IBOutlet private weak var signupButton: StyledButton!
    @IBOutlet private weak var loginButton: UIButton!
    
    @IBOutlet var textFields: [UITextField]!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    convenience required init() {
        self.init(nibName: "\(SignupVC.self)", bundle: nil)
    }
    
    
    
    
    
    // MARK: - Methods

    private func setupView() {
        topView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 40)
        containerView.roundCorners(corners: [.topLeft,.topRight], radius: 25)
        topView.applyShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6), alpha: 0.2, x: 0, y: 4, blur: 50, spread: 0)
        nameTextField.keyboardType = .namePhonePad
        emailTextField.keyboardType = .emailAddress
        phoneNumberTextField.keyboardType = .phonePad
        
        textFields.forEach {textfild in
            textfild.setPadding(horizontal: 12)
        }
        setPlaceholders()
    }
  
    private func setPlaceholders(){
        nameTextField.placeholder = "Write 14 character"
        emailTextField.placeholder = "Write your email"
        phoneNumberTextField.placeholder = "Write 11 numbers"
        passwordTextField.placeholder = "Write 8 character at least"
        confirmPasswordTextField.placeholder = "Write your password again"
    }

}
