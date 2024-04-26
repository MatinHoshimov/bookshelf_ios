//
//  RegisterLoginVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 20/02/24.
//

import UIKit
import SnapKit

class RegisterLoginVC: UIViewController {
    
    
    //MARK: - UI Components
    private let authHeaderView = AuthHeaderView(title: "Давайте начнем!", subTitle: "Пожалуйста, введите свои действительные данные, чтобы создать учетную запись.", image: UIImage(named: "registerTitleImage")!)
    
    lazy var myJoinButton = CustomButton(title: "Прсоединиться", backgroundColor: UIColor(hex: 0xF26B50, alpha: 1), setTitleColor: UIColor.white, fontSize: .big)
    
    lazy var goToLoginWindowButton = CustomButton(title: "У вас есть учетной записи? Войти", backgroundColor: .clear, setTitleColor: UIColor(hex: 0x8E8F97, alpha: 1), fontSize: .small)
    
    private let myTextFieldView = AddTextFieldMyView()

    
    //MARK: LifeCurcle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        tappedButton()
        
        setupUI()
    }
    
    //MARK: - UI Setup
    func setupUI(){
        let scrollViewWithStackView = setupScrollViewWithStackView(axis: .vertical, spacing: 24)
        let scrollView = scrollViewWithStackView.scrollView
        let stackView = scrollViewWithStackView.stackView
        
        stackView.addArrangedSubview(authHeaderView)
        stackView.addArrangedSubview(myTextFieldView)
        stackView.addArrangedSubview(myJoinButton)
        stackView.addArrangedSubview(goToLoginWindowButton)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(view.snp.width).inset(16)
        }
        
        myJoinButton.snp.makeConstraints {
            $0.height.equalTo(56)
        }
        
    }
    
    //MARK: - Selector Button
    func tappedButton(){
        self.goToLoginWindowButton.addTarget(self, action: #selector(didTapGoToLogin), for: .touchUpInside)
        self.myJoinButton.addTarget(self, action: #selector(didTapJoinNextWindow), for: .touchUpInside)
    }
    
    @objc func didTapJoinNextWindow(){
        let registerUserRequest = RegisterUserRequest(
            username: self.myTextFieldView.userNameTextField.text ?? "",
            email: self.myTextFieldView.emalTextField.text ?? "",
            password: self.myTextFieldView.passwordTextField.text ?? ""
        )
        
        // Username Check
        if !Validator.isValidUsername(for: registerUserRequest.username){
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        // Email Check
        if !Validator.isValidEmail(for: registerUserRequest.email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password Check
        if !Validator.isPasswordValid(for: registerUserRequest.password){
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        print(registerUserRequest)
    }
    
    @objc func didTapGoToLogin(){
        self.navigationController?.popViewController(animated: true)
        print("Откотить назад на экран регистрации")
    }

}
