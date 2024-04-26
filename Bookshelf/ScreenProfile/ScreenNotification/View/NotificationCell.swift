//
//  NotificationCell.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 17/04/24.
//

import UIKit
import SnapKit

class NotificationCell: UITableViewCell {
    
    //MARK: -> UI Element
    
    let projectView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        v.layer.cornerRadius = 12
        return v
    }()
    
    let dateSendNotificationLabel: UILabel = {
        let label = UILabel()
        label.text = "14 июль, 18:06"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = UIColor.systemGray
        return label
    }()
    
    let statusNotificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Новое"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    let imageNotification: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        image.image = UIImage(named: "notificationImage")
        return image
    }()
    
    let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Юхуууууууу, вы закончили читать книгу, вас ждут новые книги"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    //MARK: -> LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "NotificationCell")

        setupCell()
    }
    
    //MARK: -> UISetup
    private func setupCell(){
        contentView.addSubview(projectView)
        [dateSendNotificationLabel, statusNotificationLabel, imageNotification, descriptionTitleLabel].forEach{
            projectView.addSubview($0)
        }
        
        projectView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        
        dateSendNotificationLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(15)
        }
        
        statusNotificationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        imageNotification.snp.makeConstraints {
            $0.top.equalTo(dateSendNotificationLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            //$0.trailing.equalTo(descriptionTitleLabel.snp.leading).offset(10)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.width.equalTo(36)
        }
        
        descriptionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(dateSendNotificationLabel.snp.bottom).offset(10)
            $0.leading.equalTo(imageNotification.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
        
}
    

        

            
