//
//  ScreenAboutWithProgrammVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 16/04/24.
//

import UIKit
import SnapKit

class ScreenAboutWithProgrammVC: UIViewController {
    
    private let titleProjectNameLabel: UILabel = {
        let label = UILabel()
        label.text = "BOOKSHELF"
        label.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: 0x5E7BDE, alpha: 1)
        return label
    }()
    
    private let versionProjectLabel: UILabel = {
        let label = UILabel()
        label.text = "Версия 1.1.0"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    private let dateProjectLabel: UILabel = {
        let label = UILabel()
        label.text = "© 2023 ООО «Alif Tech»"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: 0xF26B50, alpha: 1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "О программе"
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        
        setupUI()
    }
    
    private func setupUI(){
        [titleProjectNameLabel, versionProjectLabel, dateProjectLabel].forEach{
            view.addSubview($0)
        }
        
        titleProjectNameLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        versionProjectLabel.snp.makeConstraints {
            $0.top.equalTo(titleProjectNameLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        dateProjectLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.centerX.equalToSuperview()
        }
    }

}
