//
//  mailTextFieldView.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 27/02/24.
//

import UIKit
import SnapKit

class MailTextFieldView: UIView {
    
    //MARK: - UI Components
    private let emailIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emailIcon")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var emailTextField = CustomLoginTypeTextField(authFieldType: .email)
    
    //MARK: - LifeCurcle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 0.9
        self.layer.borderColor = UIColor(hex: 0xFA866F, alpha: 1).cgColor
        self.addSubview(emailIcon)
        self.addSubview(emailTextField)
        
        emailIcon.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(16)
            $0.width.equalTo(24)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(emailIcon.snp.trailing)
            $0.trailing.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
