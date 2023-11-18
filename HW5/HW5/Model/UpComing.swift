//
//  UpComing.swift
//  HW5
//
//  Created by 이신원 on 2023/11/08.
//

import Foundation

struct UpComing{
    var image: String
    var cateLable: String
    var titleLabel: String
    var dateLabel: String
}

extension UpComing{
    static var UpComingData = [
        UpComing(image: "El_Chapo", cateLable:"New Arrival", titleLabel: "El Chapo", dateLabel: "Nov 6"),
        UpComing(image: "Peaky_Blinders", cateLable:"New Arrival", titleLabel: "Peaky Blinders", dateLabel: "Nov 6")
    ]
}
