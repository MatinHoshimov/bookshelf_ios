//
//  ProfileSettingsButton.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 11/03/24.
//

import UIKit
import SnapKit

class ProfileSettingsButton: UIButton {

    private let leftImageView = UIImageView()
        private let rightImageView = UIImageView()

        override init(frame: CGRect) {
            super.init(frame: frame)
            rightImageView.image = UIImage(named: "pointerBtn")
            rightImageView.contentMode = .scaleAspectFit
            commonInit()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }

        private func commonInit() {
            // Добавляем изображения
            addSubview(leftImageView)
            addSubview(rightImageView)

            leftImageView.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(32)
                make.width.equalTo(32)
            }

            rightImageView.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(24)
                make.width.equalTo(24)
            }

            // Настройка контента кнопки
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)  // Жирный шрифт, можно настроить по вашему усмотрению
            setTitleColor(.black, for: .normal)  // Устанавливаем цвет текста
            contentHorizontalAlignment = .left  // Выравнивание текста по левому краю
            titleLabel?.textAlignment = .left  // Выравнивание текста по левому краю
            titleLabel?.numberOfLines = 1

            // Добавляем отступы для изображений
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 60)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 40.0, bottom: 0, right: 0)  // Устанавливаем отступ влево для текста
        }

        func setButtonText(_ text: String, textColor: UIColor = .black) {
            setTitle(text, for: .normal)
            titleLabel?.textColor = textColor
        }

        func setLeftImage(_ image: UIImage?) {
            leftImageView.image = image
            leftImageView.contentMode = .scaleAspectFit
        }
    

}
