//
//  MyProfileVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/02/24.
//

import UIKit
import SnapKit

class MyProfileVC: UIViewController {
    
    //MARK: - UI Components
    private let titleProfileLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(hex: 0x5E7BDE, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = "Профиль"
        return label
    }()
    
    private let headerImageView = AuthHeaderView(title: "Константинополь Константин Константинович", subTitle: nil, image: UIImage(named: "profileImage"))
    
    let profileSettingsBtn = ProfileSettingsButton()
    
    let notificationBtn = ProfileSettingsButton()
    let aboutProgrammBtn = ProfileSettingsButton()
    let exitBtn = ProfileSettingsButton()
    let iwantToGiveBook = IwantToGiveBook()
    
    

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        setupUI()
        setupFuncSettingBtn()
        tappedBtn()
    }
    
    //MARK: - UI Setup
    func setupUI(){
        let scrollViewWithStackView = setupScrollViewWithStackView(axis: .vertical, spacing: 20)
        let scrollView = scrollViewWithStackView.scrollView
        let stackView = scrollViewWithStackView.stackView
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(view.snp.width).inset(16)
        }
        
        stackView.addArrangedSubview(titleProfileLabel)
        stackView.addArrangedSubview(headerImageView)
        stackView.addArrangedSubview(profileSettingsBtn)
        stackView.addArrangedSubview(notificationBtn)
        stackView.addArrangedSubview(aboutProgrammBtn)
        stackView.addArrangedSubview(exitBtn)
        stackView.addArrangedSubview(iwantToGiveBook)
    }
    
    //MARK: -> Setup Func ProfileSettingBtnView
    func setupFuncSettingBtn(){
        self.profileSettingsBtn.setButtonText("Общие")
        self.profileSettingsBtn.setLeftImage(UIImage(named: "profileBtn"))
        
        self.notificationBtn.setButtonText("Уведомления")
        self.notificationBtn.setLeftImage(UIImage(named: "notificationBtn"))
        
        self.aboutProgrammBtn.setButtonText("О программе")
        self.aboutProgrammBtn.setLeftImage(UIImage(named: "aboutBtn"))
        
        self.exitBtn.setButtonText("Выход")
        self.exitBtn.setLeftImage(UIImage(named: "exitBtn"))
    }
    
    //MARK: - Selector
    func tappedBtn(){
        self.profileSettingsBtn.addTarget(self, action: #selector(allSettingsProfile), for: .touchUpInside)
        self.notificationBtn.addTarget(self, action: #selector(notificationBtnTap), for: .touchUpInside)
        self.aboutProgrammBtn.addTarget(self, action: #selector(aboutProgrammBtnTap), for: .touchUpInside)
        self.exitBtn.addTarget(self, action: #selector(exitBtnTap), for: .touchUpInside)
        self.iwantToGiveBook.addTarget(self, action: #selector(giveBookBtnTap), for: .touchUpInside)
    }
    
    //MARK: Кнопка: Общие
    @objc func allSettingsProfile(_ sender: UIButton){
        let vc = ScreenAllSettingVC()
        navigationController?.pushViewController(vc, animated: true)
        print("12 апрель пятница")
        print("123")
    }
    
    //MARK: Кнопка: Уведомления
    @objc func notificationBtnTap(_ sender: UIButton?){
        let vc = ScreenNotificationVC()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        navigationController?.pushViewController(vc, animated: true)
        print("123")
    }
    
    //MARK: Кнопка: О программе
    @objc func aboutProgrammBtnTap(_ sender: UIButton?){
        let vc = ScreenAboutWithProgrammVC()
        navigationController?.pushViewController(vc, animated: true)
        print("123")
    }
    
    //MARK: Кнопка: Выход
    @objc func exitBtnTap(){
        
        let alert = UIAlertController(title: nil, message: "Вы действительно хотите выйти 🙁", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Да", style: .default) { UIAlertAction in
            let screenLoginController = ScreenLoginVC()
            screenLoginController.modalPresentationStyle = .fullScreen
            //screenLoginController.modalTransitionStyle = .coverVertical
            
            self.present(screenLoginController, animated: false, completion: nil)
        }
        
        let cancelBtn = UIAlertAction(title: "Нет", style: .destructive, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Кнопка: Хочу подарить книгу
    @objc func giveBookBtnTap(){
        print("222")
    }
}
