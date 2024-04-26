//
//  AuthHeaderView.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 20/02/24.
//

import UIKit
import SnapKit

class AuthHeaderView: UIView {

    //MARK: - UI Componemts
    private let logoImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.tintColor = .white
        return im
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
     //MARK: - lifiCycle
    init(title: String, subTitle: String?, image: UIImage?){
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.logoImageView.image = image
        
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    private func setupUI(){
        
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(240)
            $0.width.equalTo(240)
            
            titleLabel.snp.makeConstraints {
                    if logoImageView.image == nil {
                        titleLabel.textAlignment = .left
                        $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
                    } else if subTitleLabel.text == nil {
                        //subTitleLabel.isHidden = true
                        titleLabel.textAlignment = .left
                        $0.top.equalTo(logoImageView.snp.bottom).offset(40)
                        $0.leading.trailing.equalToSuperview()
                        $0.bottom.equalToSuperview()
                        logoImageView.snp.makeConstraints {
                            $0.leading.equalToSuperview()
                            $0.height.equalTo(120)
                            $0.width.equalTo(120)
                        }
                    }else {
                        $0.top.equalTo(logoImageView.snp.bottom).offset(40)
                    }
                    $0.leading.trailing.equalToSuperview().inset(16)
                
                }
            
            subTitleLabel.snp.makeConstraints {
                if logoImageView.image == nil{
                    subTitleLabel.textAlignment = .left
                    $0.top.equalTo(titleLabel.snp.bottom).offset(8)
                }else{
                    $0.top.equalTo(titleLabel.snp.bottom).offset(8)
                }
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.bottom.equalToSuperview()
                
            }
        }
    }
    
}
