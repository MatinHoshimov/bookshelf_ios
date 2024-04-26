//
//  AddTextFieldMyView.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 27/02/24.
//

import UIKit

class AddTextFieldMyView: UIView {

    // MARK: - UIView Components
    private let userNameView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        return v
    }()
    
    private let emailView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        return v
    }()
    
    private let passwordView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        return v
    }()
    
    
    //MARK: - UI Components
    private let userNameIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "userIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let emailIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emailIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let passwordIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "passwordIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var showPasswordText: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "showIcon"), for: .normal)
        btn.addTarget(self, action: #selector(clickShowPasswordText), for: .touchUpInside)
        return btn
    }()
    
    var userNameTextField = CustomLoginTypeTextField(authFieldType: .username)
    var emalTextField = CustomLoginTypeTextField(authFieldType: .email)
    var passwordTextField = CustomLoginTypeTextField(authFieldType: .password)
    
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI Setup
    
    func setupUI(){
        self.addSubview(userNameView)
        userNameView.addSubview(userNameIcon)
        userNameView.addSubview(userNameTextField)
        self.addSubview(emailView)
        emailView.addSubview(emalTextField)
        emailView.addSubview(emailIcon)
        self.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(passwordIcon)
        passwordView.addSubview(showPasswordText)
        
        
        //MARK: - ALLViewConstraint
        userNameView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(userNameView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        passwordView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        //MARK: - UserNameViewConstraint
        userNameIcon.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(16)
            $0.width.equalTo(24)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(userNameIcon.snp.trailing)
            $0.trailing.equalToSuperview().offset(-5)
        }
        
        //MARK: - EmailViewConstraint
        emailIcon.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(16)
            $0.width.equalTo(24)
        }
        
        emalTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(emailIcon.snp.trailing)
            $0.trailing.equalToSuperview().offset(-5)
        }
        
        //MARK: - PasswordView
        passwordIcon.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(16)
            $0.width.equalTo(24)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(passwordIcon.snp.trailing)
            $0.trailing.equalTo(showPasswordText.snp.leading).offset(-8)
        }
        
        showPasswordText.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(24)
        }
    }
    
    var passwordShow: Bool = true{
        willSet{
            if newValue{
                self.passwordTextField.isSecureTextEntry = true
            }else{
                self.passwordTextField.isSecureTextEntry = false
            }
        }
    }
    
    //MARK: - UI Functional
    @objc func clickShowPasswordText() {
        passwordShow = !passwordShow
    }

}
