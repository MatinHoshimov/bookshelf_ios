//
//  TitleDescriptionView.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 24/04/24.
//

import UIKit
import SnapKit

class TitleDescriptionView: UIView {

    //MARK: - UI Components
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Путь scrum мастера. #Scrum Master Way"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let authorBookTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Автор "
        return label
    }()
    
    let authorUserNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "Зузана Шохова"
        return label
    }()
    
    let descriptionBookLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Основываясь на 15-летнем опыте, Зузана Шохова рассказывает, какие роли и обязанности есть у скрам-мастера, как ему решать повседневные задачи, какие компетенции нужны, чтобы стать выдающимся скрам-мастером, какими инструментами ему нужно пользоваться. "
        return label
    }()
    
    let genreTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Жанр  "
        return label
    }()
    
    let genreText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Саморазвитие"
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -> Setup UI
    func setupUI(){
        [titleLabel, authorBookTitle, authorUserNameLabel, descriptionBookLabel, genreTitle, genreText].forEach{
            self.addSubview($0)
        }
        
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        authorBookTitle.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        
        authorUserNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(authorBookTitle.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        
        descriptionBookLabel.snp.makeConstraints {
            $0.top.equalTo(authorBookTitle.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        genreTitle.snp.makeConstraints {
            $0.top.equalTo(descriptionBookLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            //$0.bottom.equalToSuperview()
        }
        
        genreText.snp.makeConstraints {
            $0.top.equalTo(descriptionBookLabel.snp.bottom).offset(10)
            $0.leading.equalTo(genreTitle.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    
    
}
