//
//  ScreenNotificationVC.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 16/04/24.
//

import UIKit
import SnapKit

class ScreenNotificationVC: UIViewController {
    
    //MARK: -> UI Components
    private var myTableView = UITableView()

    
    //MARK: -> LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Уведомление"
        view.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        
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
        myTableView.register(NotificationCell.self, forCellReuseIdentifier: "notificationCell")
    }
}

extension ScreenNotificationVC: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: -> UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as? NotificationCell else { fatalError()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("Вы нажали на ячеку\(indexPath.row)")
    }
    
    
}
