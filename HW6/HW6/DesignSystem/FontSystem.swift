//
//  FontSystem.swift
//  HW6
//
//  Created by 이신원 on 2023/11/17.
//

import UIKit

extension UIFont {
    static func fontSemibold(size fontSize: CGFloat = 40) -> UIFont {
        let familyName = "pretendard"
        let weightString = "SemiBold"
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func fontRegular1(size fontSize: CGFloat = 26) -> UIFont {
        let familyName = "pretendard"
        let weightString = "Regular"
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func fontRegular2(size fontSize: CGFloat = 20) -> UIFont {
        let familyName = "pretendard"
        let weightString = "Regular"
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func fontBold(size fontSize: CGFloat = 25) -> UIFont {
        let familyName = "pretendard"
        let weightString = "Bold"
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
}
