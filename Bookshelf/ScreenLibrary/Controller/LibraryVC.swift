//
//  LibraryVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/02/24.
//

import UIKit
import SnapKit

class LibraryVC: UIViewController {

    //MARK: -> UIComponents
    private let myTableView = UITableView()
    
    //MARK: -> LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        //title = "Bookshelf"
        
        //showToast(message: "Привет! добро пожаловать в мир книг")
        
        setupUI()
        setupTableView()
    }
    
    //MARK: -> UI Setup
    func setupUI(){
        
        view.addSubview(myTableView)
        
        myTableView.snp.makeConstraints {
            $0.top.bottom.equalTo(self.view.layoutMarginsGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }

    //MARK: -> Setup TableView
    func setupTableView(){
        myTableView.dataSource = self
        myTableView.delegate = self
        //myTableView.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        myTableView.register(SearchBarCell.self, forCellReuseIdentifier: "searchBarCell")
        myTableView.register(AddBookCell.self, forCellReuseIdentifier: "addBookCell")
        myTableView.register(BestReadersBookCell.self, forCellReuseIdentifier: "bestReadersBookCell")
        myTableView.register(MyBookCell.self, forCellReuseIdentifier: "myBookCell")
    }
}

extension LibraryVC: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: -> UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }; if section == 1 {
            return 1
        }; if section == 2 {
            return 1
        }; if section == 3 {
            return 1
        }
        
        return 0
        
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        //headerView.backgroundColor = .lightGray
        
        // Проверяем номер секции
        if section == 2 {
            let headerView = UIView(frame: CGRect(x: tableView.frame.minX, y: 0, width: tableView.frame.width, height: 50))
            // Создание и настройка элементов интерфейса для третьей и четвертой секций
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 165, height: 30))
            leftLabel.text = "Лучшие читатели"
            leftLabel.textColor = UIColor(hex: 0xF26B50, alpha: 1)
            leftLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            headerView.addSubview(leftLabel)
            
            let rightButton = UIButton(frame: CGRect(x: tableView.frame.width - 110, y: 10, width: 100, height: 30))
            rightButton.setTitle("Все", for: .normal)
            rightButton.setTitleColor(UIColor(hex: 0x5E7BDE, alpha: 1), for: .normal)
            rightButton.addTarget(self, action: #selector(rightButtonTapped(_:)), for: .touchUpInside)
            headerView.addSubview(rightButton)
            
            return headerView
            
        } else if section == 3 {
            let headerView = UIView(frame: CGRect(x: 0, y: 20, width: tableView.frame.width, height: 50))
            
            let leftLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 165, height: 30))
                    leftLabel.text = "Доступные книги"
                    leftLabel.textColor = UIColor(hex: 0xF26B50, alpha: 1)
            leftLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
                    headerView.addSubview(leftLabel)
                    
                    let rightLabel = UILabel(frame: CGRect(x: tableView.frame.width - 110, y: 10, width: 100, height: 30))
                    rightLabel.text = "149 шт"
                    headerView.addSubview(rightLabel)
            
            return headerView
            
        } else {
            return nil
        }
        
        
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Возвращаем высоту заголовка для третьей и четвертой секций
        if section == 0 || section == 1 {
            return 0
        }
        // Возвращаем 0 для первых двух секций, чтобы заголовки отсутствовали
        return 24
    }

    @objc func rightButtonTapped(_ sender: UIButton) {
        // Обработка нажатия кнопки
        print("Нажата кнопка в третьей или четвертой секции")
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarCell", for: indexPath) as? SearchBarCell else { fatalError()}
            cell.setSearchText("")
            cell.activateSearchBar()
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addBookCell", for: indexPath) as? AddBookCell else { fatalError()}
            return cell
        } else if indexPath.section == 2 {
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myBookCell", for: indexPath) as? MyBookCell else { fatalError()}
            cell.toBookTitleLabel.text = "Количество экземпляров"
            cell.toBookLabelText.text = "18 штук"
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: -> UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.section == 3 {
            let vc = ScreenDetailAboutBookVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController?.pushViewController(vc, animated: true)
            print("Вы нажали на секции\(indexPath.row)")
        }
    }
    
}
