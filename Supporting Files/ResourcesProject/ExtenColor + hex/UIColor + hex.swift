//
//  UIColor + hex.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 19/02/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


extension UIColor{
    
    static var mainAdditional: UIColor{
        return UIColor(hex: 0x9898A9, alpha: 1)
    }

    static var mainSecondary: UIColor{
        return UIColor(hex: 0x232329, alpha: 1)
    }
    
    static var mainSeparatorColor: UIColor{
        return UIColor(hex: 0xE6E8F0, alpha: 1)
    }
    
    static var mainViewColor: UIColor{
        return UIColor(hex: 0xF3F4F8, alpha: 1)
    }

    static var mainPrimary: UIColor{
        return UIColor(hex: 0x3688EA, alpha: 1)
    }
    
    static var mainWhite: UIColor{
        return  UIColor(hex: 0xFFFFFF, alpha: 1)
    }
}
