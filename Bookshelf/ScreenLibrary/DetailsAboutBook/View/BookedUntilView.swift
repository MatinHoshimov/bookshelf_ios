//
//  BookedUntilView.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 24/04/24.
//

import UIKit
import SnapKit

class BookedUntilView: UIView {
    
    //MARK: -> UI Element
    let bookedUntilLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        label.textAlignment = .left
        //label.text = "Бронировано до "
        return label
    }()
    
    let dayLeftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        //label.text = "Осталось 5 дней"
        return label
    }()
    
    
    //MARK: -> LifeCycle
    init(bookedUntilText: String, dayLeftText: String) {
        super.init(frame: .zero)
        self.bookedUntilLabel.text = bookedUntilText
        self.dayLeftLabel.text = dayLeftText
        self.backgroundColor = UIColor(hex: 0xE7E1DB, alpha: 1)
        self.layer.cornerRadius = 8
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -> SetupUI
    func setupUI(){
        [bookedUntilLabel, dayLeftLabel].forEach{
            self.addSubview($0)
        }
            
            bookedUntilLabel.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(15)
                $0.leading.equalToSuperview().offset(10)
            }
            
            dayLeftLabel.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(15)
                $0.leading.equalTo(bookedUntilLabel.snp.trailing)
                $0.trailing.equalToSuperview().inset(10)
            }
        
    }
    
}
