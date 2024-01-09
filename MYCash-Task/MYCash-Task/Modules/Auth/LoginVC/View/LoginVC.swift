//
//  LoginVC.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var emailTextField: StyledTextField!
    @IBOutlet private weak var passwordTextField: StyledPasswordTextField!
    @IBOutlet private weak var forggetPasswordButton: UIButton!
    @IBOutlet private weak var loginButton: StyledButton!
    @IBOutlet private weak var signupButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var loginViewModel:LoginViewModel!
    private let disposeBag = DisposeBag()
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBindings()
    }
    
    init(viewModel:LoginViewModel,nibName:String) {
        self.loginViewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }
    
    
    
    convenience required init() {
        let defaultViewModel = LoginViewModel()
        self.init(viewModel: defaultViewModel, nibName: "\(LoginVC.self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    private func setupView(){
        topView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 40)
        containerView.roundCorners(corners: [.topLeft,.topRight], radius: 25)
        topView.applyShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6), alpha: 0.2, x: 0, y: 4, blur: 50, spread: 0)
        emailTextField.keyboardType = .emailAddress
        emailTextField.setPadding(horizontal: 12)
        passwordTextField.setPadding(horizontal: 12)
        activityIndicator.hidesWhenStopped = true
        setPlaceholders()
    }
    private func setPlaceholders(){
        emailTextField.placeholder = "Write your email"
        passwordTextField.placeholder = "Write 8 character at least"
    }
    
    private func setupBindings() {
            loginButton.rx.tap
                .debug("Login Button Tap")
                .throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
                .withLatestFrom(Observable.combineLatest(emailTextField.rx.text.orEmpty, passwordTextField.rx.text.orEmpty))
                .subscribe(onNext: { [weak self] email, password in
                    let deviceToken = "12233454566787877"
                    self?.loginViewModel.login(email: email, password: password, deviceToken: deviceToken)
                })
                .disposed(by: disposeBag)
        
        loginViewModel.isLoading.subscribe {[weak self] in
            guard let self else {return}
            $0 ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        }
            .disposed(by: disposeBag)

            loginViewModel.loginResult
                .subscribe(onNext: { [weak self] loginModel in
                    guard let self , let userData = loginModel.data else {return}
                    print("Login successful: \(loginModel)")
                    if loginModel.success ?? false && loginModel.responseCode ?? 0 == 200 {
                        self.loginViewModel.didUserLoggedIn(userData: userData)
                    }else {
                        showMessage(typeMessage: .error, message: loginModel.message ?? "")
                    }
                    
                }, onError: { error in
                    print("Login error: \(error)")
                })
                .disposed(by: disposeBag)
        
        
        let emailValid = emailTextField.rx.text.orEmpty
            .map{self.isValidEmail($0)}
            .share(replay: 1)
        
        let passwordValid = passwordTextField.rx.text.orEmpty
            .map {self.isValidPassword($0)}
            .share(replay: 1)
        
        Observable.combineLatest(emailValid, passwordValid){$0 && $1}
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        signupButton.rx.tap
            .subscribe(onNext: {[weak self] in
                guard let self else {return}
                self.loginViewModel.didTappedOnSignup()
            }).disposed(by: disposeBag)
            
        
        }
    
    
    
}
