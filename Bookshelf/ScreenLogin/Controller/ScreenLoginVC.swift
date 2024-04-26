//
//  ScreenLoginVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 20/02/24.
//

import UIKit
import SnapKit

class ScreenLoginVC: UIViewController {

    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "С возврощением", subTitle: "Войдите в систему, используя свои данные, которые вы ввели при регистрации.", image: UIImage(named: "titleImage")!)
    
    private let customTextfieldView = AddViewCustomTextField()
    
    private let addCustomButtonView = AddCustomButtonView()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        hideKeyboard()
        self.setupUI()
        self.tappedButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    // MARK: - UI Setup
    private func setupUI(){
        let scrollViewWithStackView = setupScrollViewWithStackView(axis: .vertical, spacing: 24)
        let scrollView = scrollViewWithStackView.scrollView
        let stackView = scrollViewWithStackView.stackView
        
        
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(customTextfieldView)
        stackView.addArrangedSubview(addCustomButtonView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(view.snp.width).inset(16)
        }
    }
    
    //MARK: - Selector Button
    func tappedButton(){
        self.addCustomButtonView.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        self.addCustomButtonView.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.addCustomButtonView.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
    }
    
    @objc func didTapForgotPassword(){
        let vc = ForgotPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
        print("Вы нажали на кнопку восстановления проля")
    }
    
    @objc func didTapSignIn(){
        let loginRequest = LoginUserRequest(
            email: self.customTextfieldView.emalTextField.text ?? "",
            password: self.customTextfieldView.passwordTextField.text ?? ""
        )
        
        // Email Check
        if !Validator.isValidEmail(for: loginRequest.email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password Check
        if !Validator.isPasswordValid(for: loginRequest.password){
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        let vc = MainTabBarVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        print("Вы нажали на кнопку вход")
    }
    
    @objc func didTapNewUser(){
        let vc = RegisterLoginVC()
        self.navigationController?.pushViewController(vc, animated: true)
        print("Вы нажали на кнопку регистрация")
    }

}
