//
//  AddCustomButtonView.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 21/02/24.
//

import UIKit
import SnapKit

class AddCustomButtonView: UIView {
    
    //MARK: - UI Element
    lazy var forgotPasswordButton = CustomButton(title: "Забыли пароль?", backgroundColor: UIColor.clear, setTitleColor: UIColor(hex: 0x5E7BDE, alpha: 1), fontSize: .small)
    
    lazy var signInButton = CustomButton(title: "Войти", backgroundColor: UIColor(hex: 0xF26B50, alpha: 1), setTitleColor: UIColor.white, fontSize: .big)
    
    lazy var newUserButton = CustomButton(title: "У вас нет учетной записи? Присоединиться", backgroundColor: UIColor.clear, setTitleColor: UIColor(hex: 0x5E7BDE, alpha: 1), fontSize: .small)

    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        
        setupUI()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - SetupUI
    func setupUI(){
        self.addSubview(forgotPasswordButton)
        self.addSubview(signInButton)
        self.addSubview(newUserButton)
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(24)
            $0.height.equalTo(56)
            $0.leading.trailing.equalToSuperview()
        }
        
        newUserButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}
