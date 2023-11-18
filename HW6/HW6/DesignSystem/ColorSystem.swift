//
//  ColorSystem.swift
//  HW6
//
//  Created by 이신원 on 2023/11/17.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat){
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
    
    convenience init(rgb: Int, alpha: CGFloat) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
    
    //디자인 시스템 컬러 지정
    static var background: UIColor {
        return UIColor(rgb: 0xffF35E3E, alpha: 1.0)
    }

    static var primary: UIColor {
        return UIColor(rgb: 0xffF4F1EF, alpha: 1.0)
    }
    static var secondary: UIColor {
        return UIColor(rgb: 0xff239F95, alpha: 1.0)
    }
    static var textBlack: UIColor {
        return UIColor(rgb: 0xff2B2B2B, alpha: 1.0)
    }
}



