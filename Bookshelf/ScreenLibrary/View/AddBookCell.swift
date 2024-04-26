//
//  AddBookCell.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/04/24.
//

import UIKit
import SnapKit

class AddBookCell: UITableViewCell {
    
    //MARK: -> UI Element
    let projectView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 12
        v.backgroundColor = UIColor(hex: 0xD5DEFE, alpha: 1)
        return v
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Предлагаю приобрест или добавить книгу"
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "addBookImage")
        image.layer.cornerRadius = 12
        image.contentMode = .scaleAspectFit
        return image
    }()
    

    //MARK: -> LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "AddBookCell")
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -> Setup UI
//    func setupUI(){
//        contentView.addSubview(projectView)
//        [titleLabel, image].forEach{
//            projectView.addSubview($0)
//
//            projectView.snp.makeConstraints {
//                $0.top.equalTo(contentView.snp.top).inset(10)
//                $0.bottom.equalTo(contentView.snp.bottom).inset(10)
//                $0.leading.trailing.equalToSuperview().inset(26)
//            }
//        }
//    }
    
    func setupUI(){
        contentView.addSubview(projectView)
        projectView.addSubview(titleLabel)
        projectView.addSubview(image)
        
        projectView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(10)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().offset(-10)
            $0.trailing.equalTo(image.snp.leading)
        }
        
        
        image.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(104)
            $0.width.equalTo(180)
        }
    }
    
}
