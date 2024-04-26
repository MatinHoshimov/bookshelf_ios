//
//  MyBookVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/02/24.
//

import UIKit
import SnapKit

class MyBookVC: UIViewController {

    //MARK: -> UI Components
    private var myTableView = UITableView()
    
    //MARK: -> LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        self.title = "Мои книги"
        
        setupUI()
        setupTableView()
    }
    
    
    //MARK: -> UI Setup
    func setupUI(){
        
        view.addSubview(myTableView)
        
        myTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
    }
    
    //MARK: -> Setup TableView
    func setupTableView(){
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        myTableView.register(MyBookCell.self, forCellReuseIdentifier: "MyBookCell")
    }

}

extension MyBookVC: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: -> UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        // Устанавливаем цвет текста
        header.textLabel?.textColor = UIColor(hex: 0xF26B50, alpha: 1)
        //header.textLabel?.font = UIFont.systemFont(ofSize: 20)
        header.textLabel?.textAlignment = .left
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Бронированная книга"
        case 1: return "Прочитанные книги"
        default: return nil
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var label: UILabel = UILabel()
//        var view: UIView = UIView()
//
//        if section == 0{
//            label.text = "Бронированная книга"
//            label.textColor = UIColor.orange
//            view.backgroundColor = UIColor.lightGray
//        } else {
//            label.textColor = UIColor.orange
//            label.text = "Прочитанные книги"
//            view.backgroundColor = UIColor.lightGray
//        }
//        return label
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyBookCell", for: indexPath) as? MyBookCell else { fatalError()}
            cell.toBookTitleLabel.text = "Бронировано до"
            return cell
        }else {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyBookCell", for: indexPath) as? MyBookCell else { fatalError()}
            cell.toBookTitleLabel.text = "Количество экземпляров"
            cell.toBookLabelText.text = "18 штук"
            return cell
        }
    }
    
    //MARK: -> UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.section == 0 {
            print ("Вы нажали на 1 секции на ячейку: \(indexPath.row)")
        } else {
            print ("Вы нажали на 2 секции на ячейку: \(indexPath.row)")
        }
    }
    
    
    
}
