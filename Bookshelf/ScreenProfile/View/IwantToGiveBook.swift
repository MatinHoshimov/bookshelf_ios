//
//  IwantToGiveBook.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 29/03/24.
//

import UIKit
import SnapKit

class IwantToGiveBook: UIButton {
    
    private let rightImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        rightImageView.image = UIImage(named: "giveBookImage")
        rightImageView.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor(hex: 0xF4D292, alpha: 1)
        self.layer.cornerRadius = 10
        
        self.setTitle("Хочу подарить книгу", for: .normal)
        setupView()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(rightImageView)
        
        rightImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitleColor(.black, for: .normal)
        contentHorizontalAlignment = .left
        titleLabel?.numberOfLines = 1
        titleLabel?.textAlignment = .center
    }
    
}
