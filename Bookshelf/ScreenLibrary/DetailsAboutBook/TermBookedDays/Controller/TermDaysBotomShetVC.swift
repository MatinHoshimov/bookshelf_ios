//
//  TermDaysBotomShetVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 24/04/24.
//

import UIKit
import SnapKit

class TermDaysBotomShetVC: UIViewController {
    
    //MARK: -> UI Element
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите срок бронирования"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var toBookedButton = CustomButton(title: "Бронировать", backgroundColor: UIColor(hex: 0xF26B50, alpha: 1), setTitleColor: UIColor.white, fontSize: .big)
    
    
    //MARK: -> LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        
        setupUI()
    }
    
    
    //MARK: -> SetupUI
    func setupUI(){
        [titleLabel,toBookedButton].forEach{
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.equalToSuperview().offset(20)
        }
        
        toBookedButton.snp.makeConstraints {
            $0.bottom.equalTo(view.layoutMarginsGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(328)
            $0.height.equalTo(56)
        }
    }

}
