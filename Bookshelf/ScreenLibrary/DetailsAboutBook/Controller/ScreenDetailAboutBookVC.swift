//
//  ScreenDetailAboutBookVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 23/04/24.
//

import UIKit
import PanModal
import SnapKit

class ScreenDetailAboutBookVC: UIViewController {
    
    //MARK: - UI Components
    
    var titleImageView = ImageTitle()
    
    var titleDescriptionView = TitleDescriptionView()
    
    var bookedUntilView = BookedUntilView(bookedUntilText: "Количество экземпляров", dayLeftText: "8 штук")
    
    lazy var toBookButton = CustomButton(title: "Бронировать", backgroundColor: UIColor(hex: 0xF26B50, alpha: 1), setTitleColor: UIColor.white, fontSize: .big)
    
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        title = "Подробно о книге"
        self.toBookButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        let myButton = UIBarButtonItem(image: UIImage(named: "saveBook"),
                                       style: .done,
                                       target: self,
                                       action: #selector(greenColor))
        myButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = myButton
        
        setupUI()
    }
    
    @objc func greenColor(){
        view.backgroundColor = .red
    }
    
    //MARK: - UI Setup
    func setupUI(){
        view.addSubview(toBookButton)
        
        toBookButton.snp.makeConstraints {
            $0.bottom.equalTo(view.layoutMarginsGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(328)
            $0.height.equalTo(56)
        }
        
        let scrollViewWithStackView = setupScrollViewWithStackView(axis: .vertical, spacing: 20)
        let scrollView = scrollViewWithStackView.scrollView
        let stackView = scrollViewWithStackView.stackView
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.layoutMarginsGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(toBookButton.snp.top)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(view.snp.width).inset(16)
        }
        
        [titleImageView, titleDescriptionView, bookedUntilView].forEach{
            stackView.addArrangedSubview($0)
        }
        
    }
    
    //MARK: -> Selector Button
    @objc func tappedButton(){
        let vc = TermDaysBotomShetVC()
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        present(vc, animated: true)
        print("To Book")
    }
    
    

}
