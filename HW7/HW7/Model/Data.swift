//
//  Data.swift
//  HW7
//
//  Created by 이신원 on 2023/11/18.
//

import UIKit

struct PardData : Codable {
    let data : [DataList]
}

struct DataList : Codable {
    let name : String
    let age : Int
    let part : String
    let imgURL : String
}
