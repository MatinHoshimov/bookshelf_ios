//
//  MyBookCell.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 05/04/24.
//

import UIKit
import SnapKit

class MyBookCell: UITableViewCell {
    
    //MARK: -> UI Element
//    private var allViewElement = UIView()
    
    let imageBook: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "BookImage")
        return image
    }()
    
    let toBookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.gray
        label.textAlignment = .left
        //label.text = "Бронировано до"
        return label
    }()
    
    let toBookLabelText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "04.07.2023"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Путь scrum мастера. #Scrum Master Waydnfsdfkndsknfkjdsnfjkdns"
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Автор  "
        return label
    }()
    
    let authorLabelText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "Зузана Шохова"
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.gray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Жанр  "
        return label
    }()
    
    let genreLabelText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "Саморазвитие"
        return label
    }()
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "myBookCell")
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        [imageBook, toBookTitleLabel, toBookLabelText, descriptionLabel, authorLabel, authorLabelText, genreLabel, genreLabelText].forEach{
            contentView.addSubview($0)
        }
        
        imageBook.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(8)
            //$0.bottom.equalTo(contentView.snp.bottom).offset(-8)
            $0.leading.equalTo(contentView.snp.leading).offset(26)
            $0.height.equalTo(140)
            $0.width.equalTo(96)
            //$0.trailing.equalTo(contentView.snp.trailing).offset(-26)
        }
        
        toBookTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(imageBook.snp.trailing).offset(10)
        }
        
        toBookLabelText.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(toBookTitleLabel.snp.trailing).offset(10)
            
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(toBookTitleLabel.snp.top).offset(20)
            $0.leading.equalTo(imageBook.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(imageBook.snp.trailing).offset(10)
        }
        
        authorLabelText.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(authorLabel.snp.trailing).offset(5)
        }
        
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(10)
            $0.leading.equalTo(imageBook.snp.trailing).offset(10)
            $0.trailing.equalTo(genreLabelText.snp.leading)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        
        genreLabelText.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(10)
            $0.leading.equalTo(genreLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
}
