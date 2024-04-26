//
//  ExtensionViewController.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 20/02/24.
//

import Foundation
import UIKit
import SnapKit

extension UIViewController {
    
    func setupScrollViewWithStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat?) -> (scrollView: UIScrollView, stackView: UIStackView){
        
        lazy var scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.backgroundColor = .clear
        view.addSubview(scrollView)
        
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing ?? 0
        scrollView.addSubview(stackView)
        
        //        scrollView.snp.makeConstraints {
        //            $0.edges.equalToSuperview()
        //        }
        //
        //        stackView.snp.makeConstraints {
        //            $0.top.leading.trailing.bottom.equalToSuperview()
        //            $0.width.equalTo(scrollView.snp.width)
        //        }
        
        return (scrollView, stackView)
    }
    
    func showAlertController(){
        
    }
    
    //MARK: -> Вскрытие клавиатуры во время печати
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dissmisKeyboard(){
        view.endEditing(true)
    }
    
    func showToast(message: String) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            //alert.view.backgroundColor = .red
            present(alert, animated: true, completion: nil)
            
            // Скрываем сообщение через 2 секунды
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
}
