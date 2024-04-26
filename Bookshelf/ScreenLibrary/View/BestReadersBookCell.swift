//
//  BestReadersBookCell.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/04/24.
//

import UIKit
import SnapKit

class BestReadersBookCell: UITableViewCell {

    //MARK: -> UI Element
    private let projectView: UIView = {
        let view = UIView()
        return view
    }()

    
    
    //MARK: -> LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "bestReadersBookCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -> Setup UI

}
