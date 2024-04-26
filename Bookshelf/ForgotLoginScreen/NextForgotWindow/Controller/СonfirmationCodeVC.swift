//
//  СonfirmationCodeVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 28/02/24.
//

import UIKit
import SnapKit

class ConfirmationCodeVC: UIViewController {

    
    
    //MARK: - Variables
    var receiveMail = ""
    
    //MARK: - UI Components
    
    private let titleView = AuthHeaderView(title: "Код подтверждения", subTitle: "Мы отправили подтверждение кода по адресу", image: nil)
    
    private let mailTextTitle: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = ""
        return label
    }()
    
    lazy var sendAgainButton = CustomButton(title: "Отправить еще раз", backgroundColor: .clear, setTitleColor: .black, fontSize: .big)
    
    lazy var confirmButton = CustomButton(title: "Подтвердить", backgroundColor: UIColor.systemGray5, setTitleColor: .gray, fontSize: .big)
    
    
    //MARK: - LifeCurcle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        mailTextTitle.text = receiveMail
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: <#T##Any?#>, action: <#T##Selector?#>
        //self.navigationController?.navigationBar.backgroundColor = .redааааа 
        sendAgainButton.layer.borderWidth = 0.9
        sendAgainButton.layer.borderColor = UIColor(hex: 0xFFD2C9, alpha: 1).cgColor
        
        tappedButton()
        setupUI()
    }
    
    //MARK: - Setup UI
    func setupUI(){
        view.addSubview(titleView)
        view.addSubview(mailTextTitle)
        view.addSubview(sendAgainButton)
        view.addSubview(confirmButton)
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        mailTextTitle.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        sendAgainButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            $0.leading.equalToSuperview().offset(16)
            //$0.trailing.equalTo(confirmButton.snp.leading).offset(-12)
            $0.height.equalTo(56)
        }
        
        confirmButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalTo(sendAgainButton.snp.trailing).offset(12)
            $0.width.equalTo(sendAgainButton.snp.width)
            //$0.centerY.equalTo(sendAgainButton.snp.centerY)
            $0.height.equalTo(56)
        }
    }
    
    //MARK: - Selector Button
    func tappedButton(){
        self.confirmButton.addTarget(self, action: #selector(tappedConfirmBtn), for: .touchUpInside)
        self.sendAgainButton.addTarget(self, action: #selector(tappedSendAgainBtn), for: .touchUpInside)
    }
    
    @objc func tappedSendAgainBtn(){
        print("tappedSendAgainBtn")
    }

    @objc func tappedConfirmBtn(){
        print("tappedConfirmBtn")
    }
}
