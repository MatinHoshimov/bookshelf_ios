//
//  ImageTitle.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 24/04/24.
//

import UIKit
import SnapKit

class ImageTitle: UIView {

    var image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image.image = UIImage(named: "BookImage")
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFit
        //self.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI(){
        self.addSubview(image)
        
        image.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(174)
            $0.height.equalTo(254)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
