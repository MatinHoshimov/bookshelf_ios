//
//  ForgotPasswordVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 20/02/24.
//

import UIKit
import SnapKit

class ForgotPasswordVC: UIViewController {
    
    
    //MARK: - UIComponents
    
    private let authHeaderView = AuthHeaderView(title: "Восстановление пароля", subTitle: "Введите свой адрес электронной почты, чтобы восстановить пароль", image: UIImage(named: "") ?? nil)
    
    private let myEmailTextFieldView = MailTextFieldView()
    
    private let customButton = CustomButton(title: "Восстановить", backgroundColor: UIColor(hex: 0xF26B50, alpha: 1), setTitleColor: UIColor.white, fontSize: .big)

    
    //MARK: - LifeCurcle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        
        
        setupUI()
        selectButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupUI(){
        view.addSubview(authHeaderView)
        view.addSubview(myEmailTextFieldView)
        view.addSubview(customButton)
        
        authHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        myEmailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(authHeaderView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            //$0.height.equalTo(56)
        }
        
        customButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
    }
    
    //MARK: - Selector Button
    
    func selectButton(){
        self.customButton.addTarget(self, action: #selector(nextConfirmationCodeVC), for: .touchUpInside)
    }
    
    @objc func nextConfirmationCodeVC(){
        guard let email = self.myEmailTextFieldView.emailTextField.text, !email.isEmpty else {
            let vc = ConfirmationCodeVC()
            vc.receiveMail = myEmailTextFieldView.emailTextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
            print("tapped")
            return
        }
    
    }

}
