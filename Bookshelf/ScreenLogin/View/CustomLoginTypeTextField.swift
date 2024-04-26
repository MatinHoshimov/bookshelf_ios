//
//  CustomLoginTypeTextField.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 20/02/24.
//

import UIKit

class CustomLoginTypeTextField: UITextField {
    
    enum CustomLoginTypeTextField {
        case username
        case email
        case password
    }
    
    let authFieldType: CustomLoginTypeTextField
    
    init(authFieldType: CustomLoginTypeTextField) {
        self.authFieldType = authFieldType
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch authFieldType {
            
        case .username:
            self.placeholder = "Имя и Фамилия"
        case .email:
            self.placeholder = "Электронная почта"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .password:
            self.placeholder = "Пароль"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
