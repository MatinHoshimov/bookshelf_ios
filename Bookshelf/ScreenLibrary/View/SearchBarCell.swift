//
//  SearchBarCell.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/04/24.
//

import UIKit
import SnapKit

class SearchBarCell: UITableViewCell, UISearchBarDelegate {
    
    //MARK: -> UI Element
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Поиск"
        search.backgroundColor = UIColor.white
        search.searchTextField.clearButtonMode = .whileEditing
        search.text = ""
        return search
    }()
    

    //MARK: -> LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "searchBarCell")
        self.backgroundColor = UIColor(hex: 0xF6F2ED, alpha: 1)
        setupUIElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -> Setup UI
    func setupUIElement(){
        contentView.addSubview(searchBar)
        searchBar.delegate = self
        
        searchBar.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(56)
            
        }
    }
    
    //MARK:
    func setSearchText(_ text: String) {
        searchBar.text = text
    }
    
    func activateSearchBar(){
        searchBar.becomeFirstResponder()
    }
    
    //MARK: -> UISearchBarDelegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Изменен текст в поисковой строке: \(searchText)")
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // Здесь вы можете обрабатывать нажатие кнопки поиска на клавиатуре
        }
    
}
