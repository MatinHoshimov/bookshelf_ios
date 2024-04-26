//
//  CustomButton.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 21/02/24.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        
        case big
        case small
    }
    
    //MARK: - LifeCycle
    init(title: String, backgroundColor: UIColor, setTitleColor: UIColor, fontSize: FontSize){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = backgroundColor
        
        self.setTitleColor(setTitleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
